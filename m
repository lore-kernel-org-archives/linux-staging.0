Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0059839EB5B
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 05:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785303093; cv=none; b=hQBaJwxGRtA639lQmInlanCjdcQGWL9Ix+hDyn8WdZoVPnzKsuDRwIN9NWVdSMWZHHZzinxlHcBCGuJexzsVB3rBLvJDO1w+ZC29aIEPTfITsrZLczlK5+B3ra7HFY3ShfjLnvDblPLuVKGRV3Drpg72e3FCBpL6i072EHQH8Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785303093; c=relaxed/simple;
	bh=TK73DyNBFNgavPIJ8NX7LzeWA/wjG1g5dTxoKb05AaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuxITD5f1k8nxDj/jsTmcNsVdSlg8pFtrRGQOO6twgJU5Hi3leS1EGLcmD+cdm2xyQwS21jJrRnqVmIV0yuq0HWWqk17jQM7xbIgffF8UI6fEECd+4bAlvYcbLnscpQFgBpTM+5QrcRqhvbELtCbNgFac5TkxYYjDH2Vrs6E9yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcq2DAg8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcq2DAg8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so4195845e9.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 22:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785303090; x=1785907890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZkhjXFCyNRKV6oXHNjuiRGL2GiMm192P3++mpEhAgw=;
        b=kcq2DAg8C47jlNcaMfnkRGaSvMslNhtlN/2uYaSeHo/EhFbtvKEFJ0Uy5odwzpTcjy
         y39DL8dwtG6hR4CMbt7NkG+5izvOz1r+Mpxks3KnP0X64+Gqf/i719s3E7KhkMuwuIPh
         Nufko66vrPKFq9Zb/Y5eTsx/N+ZfeCJ3twRB6CYKjc84LtC6A8cld2Xniq3/GUsSHAnT
         ptDtd4GM2+o6nZ+MZrYI19duv4pKgaBI98GL90xa0n+hCXquYjUMQ9U+qRqmWIFVYzCt
         Zy4iZbjiTF4/Dmmb8uA/HiFOhHQhBhYMPnQidT+nIZgwrPHHbCozRx79u7o7XSW27XIa
         jHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785303090; x=1785907890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZkhjXFCyNRKV6oXHNjuiRGL2GiMm192P3++mpEhAgw=;
        b=X5cV/9msRdxakuwTpkEexFJAuw6dGbzl/qQgqUMpE3VIrqBhf86WgfhQFM81CleANf
         +Padcgs3UbQ535Bj7706lCuUFxMa8vYP5c+4g296IYRV0h6hN1pQkNY7tU7yd4wV3TpQ
         Y/3wpw+TYLnS0aGl/uk9J0Js9iV0345S7ehaKC/SvlpB5vte01fGmvzwX28jI8oTKJw1
         VbZI0YjIpnNXwJ+TFQ52f7YUbLfvSEHAGy32DKoSWSvksW8GzFtOLNzpweGu4O/Td10K
         x4RumSOGFdu5St4jc54ZnjXxsssSxqk3SI2lo1OZUKSuOaAXgNVgfEQU7w354AhJB0Fz
         AZsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb4ML49YXAhVCNPGSuU4zaRjnLL9+0nCXlFXe3AzaEFncYnfPYaWVI7fmhfWLBqw+L9/Z/RjlHjE7Zompk@lists.linux.dev
X-Gm-Message-State: AOJu0YzVXVN5Uj5iUw0ZRTj5xnRv6AYkkhAiAQ5v1f3NCKVAONvHLpN+
	hyfiTw4tLF9PPJk9k2BbvVG7ig4g7izh50Wl1NOMqCHNYsENbO0UYFuP
X-Gm-Gg: AR+sD11lDZ+S/0o/a9x9XC6mKhO2GnJpJgcUNt13Qn9QmHbR7Z/nfWJ/vuD3tCIj42X
	dquQ87DrUKTyshD1ZakKvniNUErM1DzjaLtnJEBZvYxP1+SAEmrQpRK3Wlbc1k7DGSyx+1EoO7n
	eDbf/uiJYAask0yTgDxS9iojgJUygcidxrG4w0KiedZhV5QH1YU0in+y+pUeXKGE0FEUr2O8fDr
	RuTL42C8zyE5pE07coM4++EKbVE0R99jnnicTG1fgVvwIy2KD4bJqJhSytGcKqoLyjP3w4Jycxn
	JBfiDuJrFk2HRmP6ncBe9WTfEfunIqTO34n/JOuaRcyl1X4PMKcXTlpRijYjOOQf32UK4oZD8Y2
	n9XZ+78HW/2qw9Gqyohq6VIoaSZvY2EYmMV1naFeaROpYeEflHjY2MASqdjANmu4XMGHt1lMkkU
	Y/1z3NjysCDqEFrCncigDq6brMSuPTeS6UiyiNBuB+X/XQv4ANuvbtBaE+
X-Received: by 2002:a05:600c:6986:b0:495:3aac:1098 with SMTP id 5b1f17b1804b1-496c6591311mr60736795e9.32.1785303090216;
        Tue, 28 Jul 2026 22:31:30 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bff4784sm337623375e9.4.2026.07.28.22.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:31:29 -0700 (PDT)
Date: Wed, 29 Jul 2026 08:31:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yi Cong <cong.yi@linux.dev>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yi Cong <yicong@kylinos.cn>
Subject: Re: [PATCH 2/4] staging: rtl8723bs: fix double free when
 register_netdev() fails
Message-ID: <ammQLsniXJ4LwNRF@stanley.mountain>
References: <20260729022509.2863634-1-cong.yi@linux.dev>
 <20260729022509.2863634-3-cong.yi@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729022509.2863634-3-cong.yi@linux.dev>

On Wed, Jul 29, 2026 at 10:25:07AM +0800, Yi Cong wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> When register_netdev() fails, the error_register_netdev label in
> _rtw_drv_register_netdev() frees the adapter and netdev via
> rtw_free_drv_sw()/rtw_free_netdev() and then returns _FAIL.
> 
> The caller rtw_drv_init(), however, still holds a non-NULL if1 on this
> failure path and jumps to free_if1, where rtw_sdio_if1_deinit() invokes
> rtw_free_drv_sw() and rtw_free_netdev() again on the same already-freed
> objects, resulting in a double free / use-after-free.
> 
> Drop the freeing from error_register_netdev and let rtw_sdio_if1_deinit()
> perform the tear-down, which is the single owner for this path.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Yi Cong <yicong@kylinos.cn>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index f31196f54b3e..ac401042faf4 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -773,10 +773,12 @@ static int _rtw_drv_register_netdev(struct adapter *padapter, char *name)
>  
>  error_register_netdev:
>  
> -	rtw_free_drv_sw(padapter);
> -
> -	rtw_free_netdev(pnetdev);
> -
> +	/* Let the caller (rtw_drv_init -> rtw_sdio_if1_deinit) release the
> +	 * adapter and netdev. Freeing them here would lead to a double free:
> +	 * rtw_drv_init() still holds a non-NULL if1 and calls
> +	 * rtw_sdio_if1_deinit(), which invokes rtw_free_drv_sw() and
> +	 * rtw_free_netdev() again on the already-freed objects.
> +	 */

No need for this comment.  These weren't allocated in
_rtw_drv_register_netdev() and no one really expects them to be
freed here either.  AI always adds obvious comments but eventually
the kernel will turn into the Terms of Service text which no one can
possibly read in a life time.

regards,
dan carpenter

