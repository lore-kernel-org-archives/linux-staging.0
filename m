Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E1534D4CE
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855836; cv=none; b=Tl5McdVY+VezSN9EaoIZIiL7eANLku/YIj5slNRKkuIUaPkRDjkm4Osa4OLnqzwYvlycYUfv/eAJqxBzWeUA3PcwywDVq0j1lD7vzU6UASRzLDLLMG8Vi0mn+JViKsWCRZ+LtbLaB8XfYjPwmYwRa5KD4kEMwkuLNYr6ivfxVDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855836; c=relaxed/simple;
	bh=V98SV8N4xFgN6Jtx6c2EYPyUKEtUA6cVCNL9U6mMmL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adRk//KL2TsUZot9mVk1QYdV5Qz87NNvXTCT9QOJelbIXj/RGCtKmMsGVBxCRucCgm4pvB+SQTgV/8pUC7hoEk+wNAWJtI/y3+zmgPwidM1+8cNhm0p1TZyNidpWnVpjaB0Gkz/I95B9T56y+bx3qoUkzsqgTHvTOC3e28ZnEX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngjE0y1I; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngjE0y1I"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69e4af5a411so1371565eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 00:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855834; x=1782460634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dO90lKLEZhq2f1mujkxGkWO69NBz1QyUSgK2ZbZ+RmM=;
        b=ngjE0y1IwsA+tL83X187bgN3PJgpWM1SbTFJw9IM7xBrsbpvoehMpcl14DvsCYBN9/
         AV34rBtO19mZYpLSpcA00OWcHDHsh9f9yUSwm6ua7m31kNgrvA5f29FatxSdQqEMnLy4
         M10zR9Hs6lS6QINaY9m8goPfsCe7QGVpBwTE/MNR0Vrr1keep8syDFyubl7b42SMCQxd
         gGu2Mg8v9fJbeqameMsgNtZW+F0TKQG+CBUti7kfn04aX+GzYZGBtFwpuRXiHglfSRfB
         k0oHMydf5Bs2dVaqY9Ghpyt11AjjDx7zTLLviQamJzpbW1VK2sWI2Xc+DVfc4ZPezUjC
         I2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855834; x=1782460634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dO90lKLEZhq2f1mujkxGkWO69NBz1QyUSgK2ZbZ+RmM=;
        b=A5vIEVALOTxtEnYW3AfJnYkEBJWYh/xffmj7/VZOjqwMsrZfjBtWsiCnS1qz8nKgVh
         vBseF/qjW2pYwj7+z8epR7O0QWfl322zUGczb4eBVC68b4B9U0aPG7rRBAwmFXMZDI+j
         u9U/6v/sHAiQVtwDi/QNvCOe0UoT7pfv9RKWbxr0yzhvuOmBW3N0YODbLjfdLKtQZB62
         25jOWCQK5Hon207dAoGMkCcXXsWJMLk4mSlU0uJlVwv2HfuoFIRGVv/geeF9bCIbP6X1
         3pOv+LQY0E4M+A0q5WecGqRUyOQCs5KYqgOa90uglW9wwsAjSOZ2A/a75NacOMqmo82U
         3/7w==
X-Forwarded-Encrypted: i=1; AFNElJ+Lys+os1Eh2N5X6Kwq+B7cIQ/KlCvWvjV9Hw0slu7vQKFQhsy8Ut820R0LnOJ16HZEY+yp21qxiXeeo+WE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+BxhVsA6CNKYSH6FDWG34XzHtNkk/kKO6iDRWPCjcDRG+4Tjk
	3H21efnS8F4NlWnvxnVQuPuN6yyXKPPjOvHMKTFLaN7XIX1HbqCmoH8p
X-Gm-Gg: AfdE7cmCp4yAofba0naylHVLCwV0Ao7/SJIIlPo6zTfUGrwnQYtbmMDDE40tZAHokeb
	UeZJpDgSdM69w52toQWyIBmfYdpFKYA5cMtnwoM50qFl6CLx6QROKYrQ7f7+kzf0x60+v8GhBZZ
	0wgFCkNQ+YLa/ayukq7ZVuQf/R+sfk14Bpefp5at1ELkUdNNp1MX0TbKgNO12GJyqFM4T9YTV/7
	QUAwRlurtRZ+OGoV01NPNs8XSJ5EpgHsh2+V7SaBKmbKkDZQSU1NEPJ7mPKa6qO0vEGjqJ6Pmpz
	G8XidlYetvgljT1GkNqrpMWSi5fESLx0KAu8q7oi5niCvJF+lfUpi8YeQYetPsnP6mcb5KAiYbU
	vbi+LioXMb2D+39ibrosV9Lnq37VKjl8PwCRJQiy/kBMk0U3Hjh8R33XBzVwcCZHPwxokx5A79K
	Dyq5loDRM=
X-Received: by 2002:a05:6820:1a0a:b0:694:9ea7:7aa1 with SMTP id 006d021491bc7-6a0d884699fmr2454017eaf.5.1781855834661;
        Fri, 19 Jun 2026 00:57:14 -0700 (PDT)
Received: from localhost ([45.136.154.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4470a3aaf12sm1575533fac.13.2026.06.19.00.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:57:13 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:57:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: Replace bare 'uint' with
 'unsigned int' in rtw_cmd.c
Message-ID: <ajT2UgMPZcGSaqhW@stanley.mountain>
References: <20260619022210.143940-1-mokshpanicker.7@gmail.com>
 <20260619022210.143940-2-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619022210.143940-2-mokshpanicker.7@gmail.com>

On Fri, Jun 19, 2026 at 02:22:08AM +0000, Moksh Panicker wrote:
> Replace bare use of 'uint' with 'unsigned int' in rtw_joinbss_cmd().
> This fixes the following checkpatch.pl warning:
> 
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---

Someone already did this.  Please work against devel-next or linux-next.

regards,
dan carpenter

