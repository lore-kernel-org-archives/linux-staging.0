Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A6A378D73
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929268; cv=none; b=ifNhk2m2RIUfkSVeAOn+H4l7+nyfBVkG254v1UFWyYtTd/sIH1yabXSzCFq/zDw6J5fyeNixQX/HNIhsaLl6qgoFXC8OknmVQUIH5LeczFQZciCkqX3b5ZKIQKsO+Xk+KGlQB9cAOPTbISrZyvTuJ/8O3FdOw1lwHMdSocxQnlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929268; c=relaxed/simple;
	bh=GRJohqWIg4R058gukrSuVwoCfhFzLECqAEnkKdO3lo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BpeDCyYhchEO0YHxoIYQFs1t7nZmdkrvzvgzuOw5Bh7vhOMKQWu7cXcfaSl8hRMi+r8uF3FpJCblvpNg7Q4dQMJ6xf8WiDT4krBRCuh/lXE0PXMvyBTWID+8TXWR32GnKKgpywfHST2PX/yWYJbVQEu1Sxhu+kOSCl5yp50cqfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz6mQXmf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz6mQXmf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4830f029407so10126665e9.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771929265; x=1772534065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BF/xte7JCw264PQtQRy+AorszpPlMFthQTJr93+n+4=;
        b=Xz6mQXmfKUFNzYlXfsvmuJ+6TdzEsYYc7STUF7gElJIdzQohSA+TgEtyj/76RUSFNE
         +zSVs2pvfsqVTnvz4ac9gGVvGTMeMnNIIHCcFju8+K3p15MTJH8kujpO7hSC3Cj97Fop
         /knGThOdOyN2l+5R3tfE59gfomITfoQruvd5fDE4jem3VEopQ6X0gpXL0CgvxPMepqzi
         wmd1+xz0bq39FqD+iMnd3xL5sdIzCCFK979wTtL0RekVBVfTp+wgbvaGoGkVbh8Rh55S
         vW9tLsbx4O97w1XEIv1n8lLH+P3lRJ9Flimmliva+a6p8znaCZwzmIOxkHCY9RwIuS+i
         Wsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929265; x=1772534065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BF/xte7JCw264PQtQRy+AorszpPlMFthQTJr93+n+4=;
        b=aQWDRns7zS9R/aaXccW9vzFPhtj/7S2nu/tSSaxyZ8wVfLh9Mg9OHtcWDbtwt5Wfnh
         WjTjioIgU+WllX7i6YmbZgcPvu98DhGVIMkzFbH315ucD0XDhmfKPXsC6EeHF45Wu5pG
         +XW6f8g46GmD1YODFe+b2ITQ+G+f+U2XGD40u075b/ZsGnIcVtPGLkLH+FV2jUEGJFQ0
         g18TSC5cou1ZrnieW7sEUdUZgmiZ/uJ+tBwVIa1bj69fWTYZ138hEbfUVC7NN+PejhIF
         3g2N1LfcAGW4n2MM51thJXbNTX0FoOVoorWTa5qTphfwxluXKniXLdhTceCHpdCrpdq5
         2ELw==
X-Gm-Message-State: AOJu0YxADb9+KPpMEOJxEjJfZacE8akWnVm5gZY7uzmbPYf+eojhsqb3
	nZFi9dKx3E5pg64Uk1svpCZctVKXo9KDJT2yBmpoz0FGk9YVsPcPjWsc+6RHUjxA
X-Gm-Gg: AZuq6aJ6WPzudWovQLKA5kzchnHbTvWq1r/i46DBumXgBG3iy8oXbNB1RxtaUJMZ6nH
	NFJWBnY0Df/RpAo0WnsyZNy5VP6t5fuJTTyVnWSewjqXLLNJ0veh9cveFKueBBHAC91plrq0OIc
	g/lRqOc67cZ0L5iuzwWS+UtyUvhcLYRNwRInQ0j+0+9S2fnCiMU5HoyaGupY+6ZfeVScQOqjquf
	Wd465NQED8l+wbElEkxo4mLpPQv4MDcCxyU3iYsMLyAp1NdGJGRN3dWJ7SQR1kpIq357mojV6Gx
	hZuk9S+aUK/YuQbZDtUGaaNhpN/dZygkJeep8w0VJvm1OiwdtXVGp4UFNo/lPU5kuCQDF8tiSR0
	J8hLXIuYfO3rOHdsB0XcHROmcM3brc3D+wIGnjFWPx6LVOE+IzEUmEzn570k/U3xN0gV4lnKoDv
	k7rp2CpjEQokhFiLBqvhQ3fydTHOKT9oz1AzkQpnF1a2RUhHtHyyjGQIhg+uUyePUn1Lagb6veU
	/5KbG+SbeBa4O6F4Gti2uibeAxSpyVWFeRz/17suZovG3xtPGiDNTA4OoEFGAw=
X-Received: by 2002:a05:600c:6305:b0:477:9fa8:bc99 with SMTP id 5b1f17b1804b1-483a95dc3d2mr119669065e9.4.1771929264853;
        Tue, 24 Feb 2026 02:34:24 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm500687595e9.1.2026.02.24.02.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:34:24 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v3 1/3] staging: rtl8723bs: Fix "inclued" typo in ioctl_cfg80211.c
Date: Tue, 24 Feb 2026 14:34:11 +0400
Message-ID: <20260224103413.48216-1-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "inclued" to "included"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
v3: resend as series with unique subject lines (Greg)
v2: fix subject line colon spacing (Ethan)

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a47d0d3fa2b7..038157442348 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2264,7 +2264,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 
 	len = head_len + tail_len - 24;
 
-	/* check wps ie if inclued */
+	/* check wps ie if included */
 	rtw_get_wps_ie(pbuf + _FIXED_IE_LENGTH_, len - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
 
 	/* pbss_network->ies will not include p2p_ie, wfd ie */
-- 
2.52.0

