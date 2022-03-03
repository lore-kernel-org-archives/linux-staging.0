Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0497A
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 08:30:35 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 12so3939461pgd.0
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uLpTC29O7sSEzWIyhD1PQNyRAs1/upRhzEEBO0P7TrY=;
        b=R05ZV01Yp+GvJafCjJwp2DdNQL1X7N4+v2qDpWCUjxekJqjhV8nKttt+lgDdDv8VHZ
         pTpad4a62LLA8SjB/yHHEpNTxY0U28zfBa611uCN9ihzVETreTphlyPy+ETyTE4AgOSy
         RSp6pqcLA1mQfW+JjTEEtr3nMT+EN3gAPPB7pPpCIhAgeloFO+Vkph8Zctn11Qajj/U0
         QUVjSv6dTXzOO7akWefQCdrhFJznQKo01Wl+2crhxprXX9zSh/gHLWP/Xe3lMKAcW1nu
         BI3FrzUOW0QskfQ+hVH91vnr00ExY+gCD8VtMWG6RhFXS05x/6dGZMaR1NPNguf29zlo
         qAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uLpTC29O7sSEzWIyhD1PQNyRAs1/upRhzEEBO0P7TrY=;
        b=0cuIggmf3JMfakWmRcs7VQF05p1yIn7adZYhoLrjruvX/xEOKzFB5VDEUv0BxUCJx1
         GiIBmIvHDBLbeOb9RG4TQoXjkuzVuZpRL0zcn1Wq3+vnaRQ190DQTfrOcQfLeV4YdWJf
         6T1JJ99GAmWyHuUUpIVlJkK7bBV7sVnYwZLLBtUqh2qx4BsZnWX+L9XoQnRTYgvsYYqV
         tvFAbpS5KUYp7+hukoYnKXE7oADofVrsaUCXe8kdfDDCPcuZRSNcWMNOAVB5t6+chDRn
         n/B5/D2zdeONjxR97FZ9vqsTU56v89Onz6MdFULO2FpeIK7+WJMRHWzaapKIlGJI/4Hn
         J1nQ==
X-Gm-Message-State: AOAM533g2Ft8sS3rYQ6KfTuFsdYxeiTuRzAW7VOwHKn1GLT+Sn0YLyap
	uMMhUJugNIiIV/PLSYnoA5g=
X-Google-Smtp-Source: ABdhPJxl3tqNmXwEb6Rf4RyrJiQAiYb1f64m7AmzgvvLqhkGp3dQvJbj8a24YWybBg5gGNAc3KtcpA==
X-Received: by 2002:a63:8bca:0:b0:370:2717:3756 with SMTP id j193-20020a638bca000000b0037027173756mr29011952pge.604.1646296234811;
        Thu, 03 Mar 2022 00:30:34 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
        by smtp.googlemail.com with ESMTPSA id d5-20020a17090acd0500b001b9c05b075dsm7342532pju.44.2022.03.03.00.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:30:34 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: jakobkoschel@gmail.com
Cc: David.Laight@ACULAB.COM,
	akpm@linux-foundation.org,
	alsa-devel@alsa-project.org,
	amd-gfx@lists.freedesktop.org,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bcm-kernel-feedback-list@broadcom.com,
	bjohannesmeyer@gmail.com,
	c.giuffrida@vu.nl,
	christian.koenig@amd.com,
	christophe.jaillet@wanadoo.fr,
	dan.carpenter@oracle.com,
	dmaengine@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	dri-devel@lists.freedesktop.org,
	gustavo@embeddedor.com,
	h.j.bos@vu.nl,
	intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org,
	jgg@ziepe.ca,
	keescook@chromium.org,
	kgdb-bugreport@lists.sourceforge.net,
	kvm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-block@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sgx@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	linux@rasmusvillemoes.dk,
	linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org,
	netdev@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	rppt@kernel.org,
	samba-technical@lists.samba.org,
	tglx@linutronix.de,
	tipc-discussion@lists.sourceforge.net,
	torvalds@linux-foundation.org,
	v9fs-developer@lists.sourceforge.net,
	xiam0nd.tong@gmail.com
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body as a ptr
Date: Thu,  3 Mar 2022 16:30:07 +0800
Message-Id: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <A568BD90-FE81-4740-B1D3-C795EB636A5A@gmail.com>
References: <A568BD90-FE81-4740-B1D3-C795EB636A5A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

> I think this would make sense, it would mean you only assign the containing
> element on valid elements.
>
> I was thinking something along the lines of:
>
> #define list_for_each_entry(pos, head, member)					\
>	for (struct list_head *list = head->next, typeof(pos) pos;	\
>	     list == head ? 0 : (( pos = list_entry(pos, list, member), 1));	\
>	     list = list->next)
>
> Although the initialization block of the for loop is not valid C, I'm
> not sure there is any way to declare two variables of a different type
> in the initialization part of the loop.

It can be done using a *nested loop*, like this:

#define list_for_each_entry(pos, head, member)					\
	for (struct list_head *list = head->next, cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \
	  for (typeof(pos) pos;	\
	     list == head ? 0 : (( pos = list_entry(pos, list, member), 1));	\
	     list = list->next)

>
> I believe all this does is get rid of the &pos->member == (head) check
> to terminate the list.

Indeed, although the original way is harmless.

> It alone will not fix any of the other issues that using the iterator
> variable after the loop currently has.

Yes, but I stick with the list_for_each_entry_inside(pos, type, head, member)
way to make the iterator invisiable outside the loop (before and after the loop).
It is maintainable longer-term than "type(pos) pos" one and perfect.
see my explain:
https://lore.kernel.org/lkml/20220302093106.8402-1-xiam0nd.tong@gmail.com/
and list_for_each_entry_inside(pos, type, head, member) patch here:
https://lore.kernel.org/lkml/20220301075839.4156-3-xiam0nd.tong@gmail.com/

--
Xiaomeng Tong
