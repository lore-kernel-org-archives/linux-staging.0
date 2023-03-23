Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC11C04;
	Thu, 23 Mar 2023 04:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B92C433EF;
	Thu, 23 Mar 2023 04:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679547485;
	bh=bW3yke4cHvXoTJKbE4z1vm267YxnsHyDh3dtgS9IfMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLtDnTQewUVOPtVQzCyHqJ6ASgxMB//VBjnxh53ePlw9DbcgQG3JV2MTy38noEK3C
	 RUiunu26HYYNk/kwb9HL72FcG9Zt7b2klx0vY+APqOXgoJ0qNTCfXzu1Pyzil9+BSg
	 WAiPFjERIkOo8p14uyeRZr7bPAfcHMjYCgve5Hd4=
Date: Thu, 23 Mar 2023 05:58:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Alex Elder <elder@ieee.org>,
	Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
	outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: use inline function for macros
Message-ID: <ZBvcWkpMJnxea78L@kroah.com>
References: <20230321183456.10385-1-eng.mennamahmoud.mm@gmail.com>
 <2e869677-2693-6419-ea25-f0cc2efcf3dd@ieee.org>
 <alpine.DEB.2.22.394.2303212140480.2919@hadrien>
 <5efa6e6d-8573-31de-639a-d15b2e9deca0@ieee.org>
 <alpine.DEB.2.22.394.2303212218500.2919@hadrien>
 <48674d8f-9753-780c-f37c-f83ea2855ae6@ieee.org>
 <eabacc6f-c7fb-ff33-26d1-271537fb4760@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eabacc6f-c7fb-ff33-26d1-271537fb4760@inria.fr>

On Wed, Mar 22, 2023 at 11:00:41AM +0100, Julia Lawall wrote:
> Greg raised the question of whether the inline function is really as
> efficient as a macro.
> 
> I tried the following definitions:
> 
> #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
> 
> static inline struct gbphy_device *extra_to_gbphy_dev(const struct device *_dev)
> {
>        return container_of(_dev, struct gbphy_device, dev);
> }
> 
> And the following uses:
> 
> ssize_t macro_protocol_id_show(struct device *dev,
>                                 struct device_attribute *attr, char *buf)
> {
>         struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
> 
>         return sprintf(buf, "%c macro 0x%02x\n", *buf, gbphy_dev->cport_desc->protocol_id);
> }
> ssize_t extra_protocol_id_show(struct device *dev,
> 				struct device_attribute *attr, char *buf)
> {
>         struct gbphy_device *gbphy_dev = extra_to_gbphy_dev(dev);
> 
>         return sprintf(buf, "extra 0x%02x %c\n", gbphy_dev->cport_desc->protocol_id, *buf);
> }
> 
> They are a little bit different to avoid too much compiler optimization.
> 
> After doing make drivers/staging/greybus/gbphy.s, I get similar looking
> code in both cases:
> 
> Macro version:
> 
>         .type   macro_protocol_id_show, @function
> macro_protocol_id_show:
>         endbr64
> 1:      call    __fentry__
>         .section __mcount_loc, "a",@progbits
>         .quad 1b
>         .previous
>         pushq   %rbp    #
>         movq    %rdx, %rbp      # tmp96, buf
>         pushq   %rbx    #
> # drivers/staging/greybus/gbphy.c:40: {
>         movq    %rdi, %rbx      # tmp95, dev
> # drivers/staging/greybus/gbphy.c:43:   return sprintf(buf, "%c macro 0x%02x\n", *buf, gbphy_dev->cport_desc->protocol_id);
>         call    __sanitizer_cov_trace_pc        #
> # drivers/staging/greybus/gbphy.c:43:   return sprintf(buf, "%c macro 0x%02x\n", *buf, gbphy_dev->cport_desc->protocol_id);
>         movq    -32(%rbx), %rax # MEM[(struct gbphy_device *)dev_7(D) + -40B].cport_desc, MEM[(struct gbphy_device *)dev_7(D) + -40B].cport_desc
> # drivers/staging/greybus/gbphy.c:43:   return sprintf(buf, "%c macro 0x%02x\n", *buf, gbphy_dev->cport_desc->protocol_id);
>         movzbl  0(%rbp), %edx   # *buf_9(D), *buf_9(D)
>         movq    %rbp, %rdi      # buf,
>         movq    $.LC18, %rsi    #,
>         movzbl  3(%rax), %ecx   # _1->protocol_id, _1->protocol_id
>         call    sprintf #
> # drivers/staging/greybus/gbphy.c:44: }
>         movl    $13, %eax       #,
>         popq    %rbx    #
>         popq    %rbp    #
>         jmp     __x86_return_thunk
>         .size   macro_protocol_id_show, .-macro_protocol_id_show
> 
> Function version:
> 
>         .type   extra_protocol_id_show, @function
> extra_protocol_id_show:
>         endbr64
> 1:      call    __fentry__
>         .section __mcount_loc, "a",@progbits
>         .quad 1b
>         .previous
>         pushq   %rbp    #
>         movq    %rdx, %rbp      # tmp96, buf
>         pushq   %rbx    #
> # drivers/staging/greybus/gbphy.c:47: {
>         movq    %rdi, %rbx      # tmp95, dev
> # drivers/staging/greybus/gbphy.c:50:   return sprintf(buf, "extra 0x%02x %c\n", gbphy_dev->cport_desc->protocol_id, *buf);
>         call    __sanitizer_cov_trace_pc        #
> # drivers/staging/greybus/gbphy.c:50:   return sprintf(buf, "extra 0x%02x %c\n", gbphy_dev->cport_desc->protocol_id, *buf);
>         movq    -32(%rbx), %rax # MEM[(struct gbphy_device *)dev_8(D) + -40B].cport_desc, MEM[(struct gbphy_device *)dev_8(D) + -40B].cport_desc
> # drivers/staging/greybus/gbphy.c:50:   return sprintf(buf, "extra 0x%02x %c\n", gbphy_dev->cport_desc->protocol_id, *buf);
>         movzbl  0(%rbp), %ecx   # *buf_9(D), *buf_9(D)
>         movq    %rbp, %rdi      # buf,
>         movq    $.LC19, %rsi    #,
>         movzbl  3(%rax), %edx   # _3->protocol_id, _3->protocol_id
>         call    sprintf #
> # drivers/staging/greybus/gbphy.c:51: }
>         movl    $13, %eax       #,
>         popq    %rbx    #
>         popq    %rbp    #
>         jmp     __x86_return_thunk
>         .size   extra_protocol_id_show, .-extra_protocol_id_show
> 
> Both seem to access the memory directly.  Maybe the example is too simple,
> and the compiler is more likely to optimize aggressively?

Nice, that shows that it is the same both ways as the compiler version
you are using is smart enough

Which compiler and version is this?  Does it work the same for all of
the supported versions we have to support (i.e. really old gcc?)

For the most part, sysfs files are not on any sort of "fast path" so a
function call is fine, but as I mentioned before, sometimes we are
forced to move calls to container_of() to container_of_const() and that
can not be an inline function, but must remain a macro :(

thanks,

greg k-h
