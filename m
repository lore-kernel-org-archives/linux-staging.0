Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD33E6DCC
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171768; cv=none; b=sSD8We1q42Z9l4tguLnuuHsjXAeQUHe8RhPwPF4VDwRmwz3HOpgCySEj9voU4ddtKfzx50CafWv5oplWxTcjydfl/t3Vhqd/XdQ+3d4UcIkPsLQxAYU0VqssjkZzInjOevC+vjwOtqpS7NrFkKra7BPub2V0h2nYBsJc29oWkZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171768; c=relaxed/simple;
	bh=AW468umSoMxfQZuO3i3oPBw2NNfhkyDeqV5TDwGam/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/DJ71W6goA7fjBHktHRDBaXcY4ozCzahmFVy3JjrVAL6YH307OPNhS6CKWzphvVSJmvh5D5rpQnNftnkbeeQNKSDWJWxorIqpqL1kj5nf+hs4jKpxGYOBxsSVgNMVmRiKEQT9EBR7AmG/Gcy/yZlMGQZhkS1h24tB+HoQwAGd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv/zDdi8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv/zDdi8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488971db0fdso55149855e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776171764; x=1776776564; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=696EAWx7+IwRQtEykEd8+V1n8vDOpq5v6LhBAVHyZ/Y=;
        b=cv/zDdi80vgwZRU8U+ngSc/Dz7SH0ddw7X7EPM8pi4Dxs3h58yHD7j6hMDHPkFq/vR
         VmpeConrAQagv/sl5x6910NbacTp9Btn44ZTg1CRMOYbsRHo3xTM7Be82WyZROsXjEy2
         5pO6aXSlfngf4q3C9SlRe50IlQVy3cfMVlFCOFargu0CDUixZ0SnuNE4dovUC772JWFs
         sipKJkp+xDyYc7+MP8Fgx9ki/S0npubo4/tOGZRbfM33y80RVuC2XQfMqU6hvtVD459n
         kf//PR9OK+7gzWB6xfelyDZw5IvKoqJN6p9HhrCmCI9hP96E/1BVRqAGT5vroypV4kwF
         VQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171764; x=1776776564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=696EAWx7+IwRQtEykEd8+V1n8vDOpq5v6LhBAVHyZ/Y=;
        b=WdRtkdf3wnv0FKdg4p9ffh0oS2Ji6kOBvL89P+ad4jGkHUDllLR38C3HGtkO7s97xs
         GefLFXi4HVQraHcLxUPZTVJ+bsRIRTeLBJwY4psssf04nV8UmpWmWzK0fX8CH+Fl0JJQ
         aVUClLr+JT5hSKb4nXY0Vr6SgWMnc8PvZZHyGJ9YZ/9SE3GXf09bAUaox8AZKpnzJzH/
         5AgRTAcPtGo90ooTmOdGqeXXL/XGuuAV/yzlYlVdMU7C90dl82cD3mPgtlFOGJNxSSd8
         RvHNLenKPE5ltYMdcFD/EmwfKgCoG7sdEoKAAoCdiQUBgOgaltYkCBVnAUy5ZcprTnGl
         IBXg==
X-Forwarded-Encrypted: i=1; AFNElJ86QjVH1YRP+oJJhYQrbJmtkQNPMSDXPVhk8Pr1EvrtXxuKjckgTBHGv3j9laTDtFT02jcJsKOHTnPKe8sU@lists.linux.dev
X-Gm-Message-State: AOJu0YwXhaAiyRVkHNR6KN8i+lbPs6jxM2b/kyp5KkisrWLyFE+cu5rO
	/TEQxW+iPmHsTAtbnxO6bmh0FZ9Hhc3wNStRgA1PFC/xX+cFuBNJ0nJq
X-Gm-Gg: AeBDietB05pJMZUb2IEYXfFoM0dYpIO3Sx+Lz3OPq8Iq457VY6Nf3WNNYUn3XQJE2cV
	pl5j2yuiHbEfSTZkywACd/zDBlNekL/JZE0LYbHzDieDwmbh7b6QND1veskbB74NWMKfvE0ZDJC
	oIP+dYG+u8CHve8tToKdo7DGPKYqsBsv62tk44G5/YxyQpwwmg9V41yi5oc3Z2NZW2DczHL49Qq
	+BlmuvgM19bBgaeLUQkOPPpZK9fm2Rbipa9qSivqSDPDX41hFth31XMmQbRM8Q8K08Yw0tF28gg
	8yQeI3RrrTixHv3CK9EmGIfqx81BBdy3SlOIXFKJoI3latOeZvks0a0tR+G9QpHWQwUnqeK+RXa
	6bo/BfeOmZ5Q2oPgmekNBPh4Bpb8TS0GohM/6I1k1V+AfNEJQVc8dU5TkEOfAT3rvAyAXF7JxkS
	xUr/5nUseU/tsfuuScb1Gxo2EMeyn6Ecy8/Ktl
X-Received: by 2002:a05:600c:45c9:b0:488:869c:edaa with SMTP id 5b1f17b1804b1-488d67e269amr237317035e9.7.1776171763810;
        Tue, 14 Apr 2026 06:02:43 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm82588805e9.6.2026.04.14.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:02:42 -0700 (PDT)
Date: Tue, 14 Apr 2026 15:48:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
	hansg@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix frame length underflow in
 OnAuthClient
Message-ID: <ad43t8KkI0BBc-co@stanley.mountain>
References: <20260413202824.740653-1-hossu.alexandru@gmail.com>
 <20260414100804.871764-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414100804.871764-1-hossu.alexandru@gmail.com>

On Tue, Apr 14, 2026 at 12:08:04PM +0200, Alexandru Hossu wrote:
> If pkt_len is less than WLAN_HDR_A3_LEN + offset + 6, the reads of
> the seq and status fields go beyond the frame buffer. Additionally,
> when pkt_len < WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_ (30 bytes), the
> subtraction passed to rtw_get_ie() wraps around since pkt_len is
> unsigned, causing rtw_get_ie() to scan well past the end of the buffer.
> 
> Add a minimum length check after computing offset to reject frames
> that are too short before any fixed field access.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 90f27665667a..6b0ac54ad3d4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -869,6 +869,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
>  
>  	offset = (GetPrivacy(pframe)) ? 4 : 0;
                             ^^^^^^
Do we know for sure that this is within bounds?  And there is earlier
code which pokes in pframe as well.  This code is quite complicated.

I looked at how to do bounds checking but it all seems pretty
complicated to me and I haven't investigated this enough to know the
right answers.

regards,
dan carpenter

>  
> +	if (pkt_len < WLAN_HDR_A3_LEN + offset + 6)
> +		goto authclnt_fail;
> +
>  	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
>  	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
>  
> -- 
> 2.53.0
