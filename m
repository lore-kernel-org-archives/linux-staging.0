Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD352C82
	for <linux-staging@lists.linux.dev>; Wed, 19 Jan 2022 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kk4iiZlTUErZ2U15xjq9e8hcwi3VB+ffwZoiM0tGleg=; b=BfpWeP5Q4p+zlpOPaS7txxFJfQ
	ctKueDE3fz6BuT0dnaxoZf4OIds4bagEHeOR2KwwuG/1qFxCnRZ7oQ1ee9luKYtL1DLekZpzmzgIr
	spOia+ET4pSxtbIFHSCFE1pQKFMB1A4zAdQCabTNY+DtyAKymHIeWFQAxwNuhu1Rqq6UaYoptO4y9
	gwPr30497c5060Yi50OAN9mumd4Eumxqhp8UHvV4a7I46Jp6vjXe0Qu2/lUSIczLyVQu6wemyqUEz
	K1VmDV3E6Sw7a3b5IqNyN3HO9OSvfHE8m+JQhyY9dFRMpiKLQB7WSSlbGXiU9AT2X9JsWtZw/6whr
	/RbSRw9g==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nACkD-0026hj-SG; Wed, 19 Jan 2022 15:19:31 +0000
Message-ID: <dd6c45ef-70a4-9a54-affe-2bab17e13ce0@infradead.org>
Date: Wed, 19 Jan 2022 07:19:24 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] staging: fwserial: rearrange comment to avoid warning
Content-Language: en-US
To: Ajith P V <ajithpv.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220119084159.5759-1-ajithpv.linux@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220119084159.5759-1-ajithpv.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 1/19/22 00:41, Ajith P V wrote:
> fwserial.h comment contains word "bits" 2 times together.
> The sentence required this however it produce warning.
> Change the comment to make it proper.

Is that a warning from checkpatch?
If so, it's OK to ignore something like that.
checkpatch isn't perfect and we know that.


or if someone wants to apply the patch, ok.

> Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
> ---
>  drivers/staging/fwserial/fwserial.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fwserial/fwserial.h b/drivers/staging/fwserial/fwserial.h
> index 1d15f183e0fa..ae7cf84ceafc 100644
> --- a/drivers/staging/fwserial/fwserial.h
> +++ b/drivers/staging/fwserial/fwserial.h
> @@ -203,7 +203,7 @@ struct fwconsole_ops {
>   * @break_last: timestamp in jiffies from last emit_breaks
>   * @hangup: work responsible for HUPing when carrier is dropped/lost
>   * @mstatus: loose virtualization of LSR/MSR
> - *         bits 15..0  correspond to TIOCM_* bits
> + *         bits 15..0  correspond to bits TIOCM_*
>   *         bits 19..16 reserved for mctrl
>   *         bit 20      OOB_TX_THROTTLE
>   *	   bits 23..21 reserved

thanks.
-- 
~Randy
