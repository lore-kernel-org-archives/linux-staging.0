Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFF2798E8
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 01:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772156933; cv=none; b=Uii+hzgAUFtVX+Z3H7tWENZDc9ZF5gccGJwezBroLYQkT/4EJiCPAXDRELlhUlgUBqoX/pr5p3bMZnDVvJTOPZJkJw4qTjqomwDbB2Ndg5PzkdiXD4lwerlPuFm+GWVxycRvtuGeip2TMq8MCtTss3RIDpso58Uu60CXTAq8lnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772156933; c=relaxed/simple;
	bh=x5lw6lzirn3nGsr/UqnlWA5GItQk2qZQVNycZ0RrpnU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=NtuVJP8Mkmlmks4TJ2A9QAemeYLpvwWWhGghRhtvwwRiaEaYpo4MiWbmHsMY4tZOQ4cVEoFrd4v8mpicC3WCzjICRd3U7eLpNPsw5KYHj/j9uXta0g/r5zFUX3zXGbPr+JUGnrM/PcB5mm/Z4jVroiGeNmRdW9MmrHUVTTIfN5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoQPzgmL; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoQPzgmL"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-797ab169454so14731387b3.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 17:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772156932; x=1772761732; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYx+ei9nhNAkrSCy2HPgOoMTrWmAJ111E+FjcZU956Q=;
        b=DoQPzgmL6dDIf3fkT/L+54rOnlqrTMvIw8Ftc14ljByhVna5IWDtXReHdZpgj1wLcA
         vAd3yiqMqJ9tML1GXOroruKKGZ9+O8ARTX5XMMTuuV/Zjk2QRfpdwiGxO6gQZxTHSk4V
         WyMzE9Xs37nYsPzZrDUcYi1j0YV62haAtOI5v/LOBXdkOTm6hfDxplC3Zy2fYLgmYphH
         QWuWL0Z7MNl7953cdGLqj09tnkNivex+cUT2BbgmcWqPAS90gqmB7V4SFo5QTRhuLomq
         nJ6hL9OHGUVJjD22Ept5uK3uWrfzmyLFC12sBb9W0tej5KXRo9fYfAYpubsh/r3uBb5K
         EvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772156932; x=1772761732;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sYx+ei9nhNAkrSCy2HPgOoMTrWmAJ111E+FjcZU956Q=;
        b=CZcrklf1Ft191uTeg4OmjiC+hERyKz9kePc/RtR4MjmFj9IIf1aoPNaRUJwqf9pFn0
         140Dp31eHkLpls26dn2PLrc7EsqR2Whs55+u03Vmw0/DSMzTUuy6d/Fh1XTaIdC32oB4
         mLm/MJx3AlaNd8+O2/5EuL5COLCuTQqM4ZJ+N2WMTMiS42gWHngbaLZ6rJQcSrBmYfVf
         rJyWT2WAVtT6kcYyRbe/OEThG8tabAhot+aCm7PhVpNV/EldZUH5p3R0rjLwAjbZi4oF
         EhBgZjAbMKxisDtANg9+6vp1lxXVHr+cFt7LgrW/fYzdjRY0jpcXUH5bmA1u5OKGnfcs
         95Gg==
X-Gm-Message-State: AOJu0YxFM1c1JjoUh9Q+rAlXk9cJ9wK36xYsYXocy1AKtUnippCcHqqX
	mKjL1GfQaqsQiC6GFIklkhlo2oY0kub4NFeqOPr06372OfjuU33Yp75c
X-Gm-Gg: ATEYQzzrV4OrICaTK1OjHQHZfYWmiR1sAXto5LbBNRB85ObKcrClxTdXeLGqhA33//7
	pUc8ZUcAs8S0aEiK5UNwyShetXevC5w+PsmhmND0oxuBayvAlk4CCwiLKIk928uYHlawMabO1+k
	snwKeBdXdF9dHb/Bn1RmwN1uw9yYI/sBnEcION8RnHYmFBtEXAuuidiC5X/bwJY9uK4aOChUWMo
	L2nYuPvp7dweh9PpPp+0SwqHFd790KDmNf9agBVT2dBUFc4UDQ+AQ5NcJ1fCPO4LgTIeMukPjM+
	DTycUkQIDw66rf3hV20EFCYXmcoXzKV0vQW3CPwIhi/V+U3JcniktKeDrsuSvm+GTAjw4yHtQoI
	xfvtfUy7XDwVYr4JCFMwAXztTDA+qNm5EgzCA7OlN1t4Ogl2FoFyrgU+G6qvUNHGO/e4Uw5mgB3
	PGCIeTCsgjVNS6ysb3X3C4RpxJiQGJvJCnqARZ0I/qaF5DzohOD6iIMJ+btuDfOa4l170ba0jcH
	Wg2cyEMKD3MlwbgADJehAUDiCohSw5m4I/AcQKerZs=
X-Received: by 2002:a05:690c:7202:b0:797:adcf:67f8 with SMTP id 00721157ae682-7988551cc28mr14504957b3.25.1772156931631;
        Thu, 26 Feb 2026 17:48:51 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bf9270sm15436407b3.32.2026.02.26.17.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 17:48:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 19:48:32 -0600
Message-Id: <DGPD72RZFLPL.43AQ4SBBC64H@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix CamelCase variable name
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Rivka Bukchin" <rivkab300@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226084308.2915-1-rivkab300@gmail.com>
In-Reply-To: <20260226084308.2915-1-rivkab300@gmail.com>

On Thu Feb 26, 2026 at 2:43 AM CST, Rivka Bukchin wrote:
> Rename pHT_info_ie to ht_info_ie to address checkpatch warning.
>
> Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>
>
> ---
> v2:
> - Use full real name in Signed-off-by and From fields
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

You have a few issues with your commit body, please view this on how to
send a v2:

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

>  	int ret =3D _SUCCESS;
>  	u8 *p;
>  	u8 *pHT_caps_ie =3D NULL;

It'd be nice if you changed this to snake_case too.

Thanks,

ET
