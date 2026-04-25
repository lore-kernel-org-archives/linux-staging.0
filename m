Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79861339A4
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777119066; cv=none; b=ohHU8r0NPqFwRo+yYTLvdoCw3tDK9erMCR0VEvkyA9c8Q3t9nUv3+3bo1LCCYxX0rscBTDKRUZX6aLOpc0JXfMGj/zAxPFe+zhD5BmpARu9TpBRX7aWwXrnW5es5NtSM7nKLwVgfV6aiFsBFLXWomXt0pGM094OKn3VawX+64rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777119066; c=relaxed/simple;
	bh=tRPIzJjSdSJzxxUC0uf5qewtduo/4zohoMMvFeJX62k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKelP4Eetj74zRGzBtxiBw9tob+uosm2HLa2JPxhHAmZflW8sO6AlxpV1MUPNMgGQqX1dIjutZlGqNSmb+XC2w1KFthheTJFthj10AfzkhZ1TiXjuhJ3bQe47mmut0/3nAS7fHD/XyFtzI1D3D8eP4yvhGf30Qon3A5PR/OxmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJCmf0jp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJCmf0jp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso56864255e9.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777119063; x=1777723863; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qHCfIHjo+otSz7jfFFcuykVrln5Ax3WfEMDZotS3sC0=;
        b=WJCmf0jpmxR5jADFTrbEtaI8NXYGHz/8hK5eiZIMvACMzGwca0G18sePd3yvnUC9Wr
         dMGMwQFm90HVP1CbcVdBCrA+LqN0YAuX3aLYMSfg1GAVByIcpfXfu0eoWl8DED3I2XW4
         alNR9hqfK5+W2mas8XQ38UMwtTJZlkOVfTa4pl5JVqqPgtg2tJ/p+wC7pyYvbWbyJ2Yw
         B4VzoLTfsWknE/AbXGV2ciGpil1cXvVBHnHQQeYDwsGzAaMvixzdZV4R5zO7Ddlf3V1B
         nK706gWgx9fJXSVSrq2A8zp4fyrvA228osnfiYHu4ZroeIN7aBToV2wAd/9kgXx3yRcP
         tzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777119063; x=1777723863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHCfIHjo+otSz7jfFFcuykVrln5Ax3WfEMDZotS3sC0=;
        b=RzdjhynxC2EYLZOleVLojfOW1xcyY7UEz6uZri3rGDs0IRKrWR3z9lAR7KqVaBTxiu
         ox4mRhzuzj8HxY+WzeJf8Fo75fEXoCvYpjMEK4LdWT2bvHvGfKbljwb8JpyLtvzFiKso
         gWGxgtq6SCvf+p86RhzV7j/aG8VSJVfpfw149eMNU1PNAhfw+EmrLlddyZ3pzrZTM+x0
         VTs0E2jlI/Y+XCSRCNZUWqHvdiJ7Q4zVex2j0YRzwhhII9tJPWXCgGO/R8/sNEJxiSXY
         8uhtVRcfOC4ohBVaw0HxBC13KG6R/CDxXLzmNH9kuJB506zjs30PfIwQVqXKi8khfABL
         DH+w==
X-Forwarded-Encrypted: i=1; AFNElJ9AagYGXF0ksalzz/wmPyJsdaeqyZffrYYj7DZp/AZ21ZVf2a0Arfb9qG7Ee3FeMje1yJfaP8iHzPZxr9SJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2+48/jVM8qeQrKQeI/rOB6qAkGjElm9aoiCxm2Od7Fn/dwqGk
	LBkB4wbmiTejs3PK7SX2aljlCCnyPWzHQm52qxxve4NTGTtODybzB+OH
X-Gm-Gg: AeBDievoFx+SxWI+UIDWxNvd9Cb5ooqNPzcg1TRphsE98TQb0ixLSPpDsSREmOX+Y9e
	/NvZmKxZhS0iY7NXjd8Run2+1erXK8yyjS+VF4B8FKWN1Kb9501KzEdXBS7sfuY7rbPlTeIFAf4
	+WgtxshRbbz+Riy0y7nHKmiELObJT2kqQCWqKRgWfe69Spkzl/ItjBeiqF2p1J+GDNibSI3AL5A
	HePrZis8HOz692XAHPkEESCrwQ+U91JLgyFrJ+tUsUrdTSonR3K1KgqhZCo7y7RUXWKDFa2W66M
	vj+A8yLyYs9YFZDfSO+lSG63hzmP/McUISK94DfIWqiEYwyN+RWxsnhszF2nnOfj2abcee6+v68
	uf5HLQMN7rylOi3tI0R485fTTwgkl9DZs6GEcnhxTsYpUBXXoNrvBtXiRQOtixtCGLc7zWcik0l
	I6JBsqPShpx5TqslQ7s1XnNe2QhcyNY/FzLXNnSfIi
X-Received: by 2002:a05:600c:8883:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-48a582167c7mr209955855e9.8.1777119062971;
        Sat, 25 Apr 2026 05:11:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5499b0edsm325376955e9.14.2026.04.25.05.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:11:02 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:10:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/3] staging: rtl8723bs: fix heap buffer overflow in
 rtw_cfg80211_set_wpa_ie()
Message-ID: <aeyvUlS9bbEkSGzr@stanley.mountain>
References: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
 <20260424151932.3734611-4-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424151932.3734611-4-hossu.alexandru@gmail.com>

On Fri, Apr 24, 2026 at 05:19:32PM +0200, Alexandru Hossu wrote:
> supplicant_ie is a 256-byte array in struct security_priv.  The WPA and
> WPA2 IE copy paths use:
> 
>     memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
> 
> where wpa_ielen is the raw IE length field (u8, 0-255).  When a local user
> supplies a connect request via nl80211 with a crafted WPA IE of length 255,
> wpa_ielen + 2 equals 257, overflowing the 256-byte buffer by one byte into
> the adjacent last_mic_err_time field.
> 
> rtw_parse_wpa_ie() does not prevent this: its length consistency check
> compares *(wpa_ie+1) against (u8)(wpa_ie_len-2), which is (u8)(255) == 255
> when wpa_ie_len = 257, so the check passes silently.
> 
> Add explicit bounds checks for both the WPA and WPA2 paths before the
> memcpy, rejecting any IE whose total size (wpa_ielen + 2) exceeds the
> supplicant_ie buffer.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index fd3bae31b0ed..e7ba5ccfa03c 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -1445,6 +1445,10 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
>  
>  	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);

The rtw_get_wpa_ie() function is pretty suspect...  :P

KTODO: Fix the buffer overflows in rtw_get_wpa_ie()

Otherwise this patch looks like it fixes a real bug and doesn't introduce
any regressions...

regards,
dan carpenter


