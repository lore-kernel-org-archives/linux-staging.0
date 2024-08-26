Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AF633D5
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 01:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724635065; cv=none; b=V7II99la6tht6UClUktCwYinXxL/D9VXXs4dB6yu+4y9jL1Ti3u+H/Y/5nsjRnzQtrA8HruC5+wYXnEOfDuwG5a+b0mnuiSC7qC3lSDNBwQi78/PcAtUTHnuTJhg335HxOsDUu4Mq4BRfdXClZcNz74YfVYIEKR+nrI7MmzR0Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724635065; c=relaxed/simple;
	bh=ezGCtAxcjcPK8pheEZEEdKvztkYND4uAspNgza6uDhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pE1eI5HnHMeqEnEoDgps8FdNL7s8KV/NvkFbj5H6V3ogantUU+UL/rtnU0oomFN13Ml6gqrV7NXqiSgPLLvDpw05PtbxZRM1u601kxEZqtm+toO/QkSBE56PMDSS76qsyZHeeXmUYjW4s9DHe6+FP7EdKHVmlKV37wplryX6N8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Umk7BTxv; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Umk7BTxv"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f504652853so13946541fa.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 18:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724635062; x=1725239862; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxFDewXXFNunsztuQO0RvZBxeihd9YkWSHDT+saDUe4=;
        b=Umk7BTxvlaydPd6YxvoLPiSzFEt74LKng4yXK15i14xo2MMDopoZ7OmIdwvwQVgzES
         Jg/PlF1dp6ca+v3I822+dsk07PhqEu3vSJ1BBTeasYsoOkFTdxaMD+yvwoNKZi2DGGsx
         TAUNJxQmUHBhoS7dmxe3cL73C7J73DtJyMy01AvoR00wIDLL1LW7r0xYmVANFAETOZh7
         qavSc64lKmQMb31n12bXBedCtnSAeSb1rR1zXoY3G5Blr+1CTfH7cqEebJvAGSc6D0F/
         ZiB4gnvJnuHgsjgoTi3X1kpGXqiJa8N3MBjQy/JGKdsq7XYuHxknEovEJtkUqWUmjhmf
         mRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724635062; x=1725239862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxFDewXXFNunsztuQO0RvZBxeihd9YkWSHDT+saDUe4=;
        b=lmNepHbL5TDFM5FYFYQjFnMkONEDvbjpXavSs2lDENZAKWw+g8BHVDqBG5vY+elihB
         ffgSGArFl/UzuiVTNBj/nqLpbIA4icrvhOnCaG/TTggNC/1kNKwDgRsNEVDXp2rb4hp0
         ja3vQqzaDfvqZnTeaYV03F8bK3Og6sDRPpOvCtj2IqMnvRur80zerXbg20LtTa5C7y8H
         rc0wELEzqIMGwLP9ASYdivB8hFCdn9/XN/XMhP85c33PG9Rotqho+6lTXV0ZRWaOIjHl
         fFyHQ3U5n13XnbnlX/F9bOO240Xb0Yn1r1WrVOdZgoj9COBLSth9I18qR+36nsh50iCv
         ONhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSI89b2qxpbqt5/Fi07kCeompzp03c4NkWEoaZ93bqz66WigxVUyfKXNAFHbHf+rPERsZSdAdp3P4Oe/DY@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/+ltSD2fCDwNdjQM3CkcqVtKmtjwrMHC4EXq5Cu5bpSXMiHGu
	NzkDa/V0H0rXWDDW39slT+0lR3cqaVG80G+yf2ixvudpARO+CT2CHABRQw==
X-Google-Smtp-Source: AGHT+IHnZ7IT3cdohBhWPZ6YTHGuayfRidXmP/WHsf/HBFEug8GF9wIz0d/MIfigFSY8K3BmYWnoNA==
X-Received: by 2002:a05:6512:159e:b0:52f:d128:bd13 with SMTP id 2adb3069b0e04-534387bcf46mr5019071e87.39.1724635061452;
        Sun, 25 Aug 2024 18:17:41 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f39b5sm598277566b.193.2024.08.25.18.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 18:17:41 -0700 (PDT)
Message-ID: <7ab3f48d-841d-4d61-936c-9e5112a3aaef@gmail.com>
Date: Mon, 26 Aug 2024 03:17:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Fix parenthesis alignment
To: Gabriel Tassinari <gabrieldtassinari@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ~lkcamp/patches@lists.sr.ht
References: <20240824144345.8873-1-gabrieldtassinari@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240824144345.8873-1-gabrieldtassinari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/24 16:43, Gabriel Tassinari wrote:
> fix parenthesis alignment in _rtl92e_qos_handle_probe_response to
> silence checkpatch warning:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gabriel Tassinari <gabrieldtassinari@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index ad21263e725f..18739583f579 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -322,7 +322,7 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
>   
>   	if (network->flags & NETWORK_HAS_QOS_MASK) {
>   		if (active_network &&
> -				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
> +		   (network->flags & NETWORK_HAS_QOS_PARAMETERS))
>   			network->qos_data.active = network->qos_data.supported;
>   
>   		if ((network->qos_data.active == 1) && (active_network == 1) &&

Hi Gabriel,

Please make your "Subject" line more unique. Consider that we may end up 
with having dozen of commits like yours, all of them referring to 
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file or function to make it more unique.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
