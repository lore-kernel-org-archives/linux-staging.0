Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5727B340
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425851; cv=none; b=jRP3+nfqtQcnb6X0hIEQNVgYwuz0ZUa3wxUGL5IdFPZr4lmw6d1nRoHUBd8g9CqzwfzhVtFnvcOq+VvberU6YbZEbxorKE7ZTEEKDG6edkNnkOckucKbtbwm/xtujENqdV8BgTtyDiAoydblGLQ/q6lg+iW9XT5ciIR1fDlmwq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425851; c=relaxed/simple;
	bh=QcdnnanrGSpwQX4VYSwIT+JnCxCACo/jJV3o7tYIyeg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SLZ5li+vrNm7AlA+/H77NMg10uIW7yDhKfA/BOY+QSI6JXIAI5NzXUdo6BhRD/JC1mJxLMXT1aQZh1rFjN7m60RjfurpgOOaJMvgW0PbmARiSHl9/adJ9axdhSZRr+5dBlBQKiw+Yy8MpmMaMcqErJp8sTtlodXvaKf0G/CSE3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlElx00v; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlElx00v"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ddabf2ada5so19649811cf.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425848; x=1760030648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+azu5dgYYVnMo+ufve9uRrNqQVbZy8zuGrcAJ/1+bmE=;
        b=LlElx00vaS5QpIeJ53Zo+TcLppS6OM8fykkGPS4zgRdnU0AQtezb734jhqTWnCLXmi
         swG+evm7ArNUzPDEoAG6zzyC0dXGSZHE5Jki7FvMT42Aq3EfwD8GQtKsNMHlGtKEUsfT
         tSFAvH4Ogz3JMZi/PiD69hjkzQ0/YZOkTpAdJB9H0ZvVfn7hoTAziAzklKuUVlXPvGmb
         ACBKejLK0T7S60+DDej8Z7A7Sb5jgX+PvZjdCTsqXL0d73PIZZsxj3AL1pM5ltbnFbYX
         183UGgqfEs/bNd9iB8iu6CRDxxvgK9li4T5L53FWV+M1sHnEt9peRWPHOgWi/eY7logZ
         dVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425848; x=1760030648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+azu5dgYYVnMo+ufve9uRrNqQVbZy8zuGrcAJ/1+bmE=;
        b=D3qfIpHu5ulZv7jIyqaLc4ZNNjdTh+t/KUmRCbmTkviRIUSv/X4O+DYscYuqCv3lJp
         5Px2E8QwaD4UKZFIu1iG1CMonLmz83pY5S8y/ewB/zSx53iAUwFEXUCsNY7fDjSXaakS
         Pqm+uWPMVpL4dQfejrCKR96Ro/LoMZH2WIEu4wLYIspUkbooz2srZ6WaxgtTZMmiSyHI
         WJ7kYF45vWR11vnAkoB4557e20tpLrHJETtiiYRP5gfMHvwD1SWkMvV9hUIjlOYONi3r
         RlRTwwNtJrgj5rFSP+jYJw22Ojnxh1DuZtgLLcV+KaRGgMSmB6Ry1s0WyYV+YGsh30dW
         Ss5g==
X-Gm-Message-State: AOJu0Yy5+39d2d8No2O06cSXeCawOS0D8skmxyVEVU9tOHWYu2B6fqZv
	/tCHKgjbDlqVR6WhDnjzbwpxwCBm5DqDL9448K8r8/qtCjpAqj/aXccI
X-Gm-Gg: ASbGnctZqxSQNCin0bdZbuDdGHsN1RgaRdaw4JqBR0wL8GpJkIDqZGCXVnRzr4vIJA0
	VBJm5ZCf1ShUzskXUfdFOuQ6BzEVo215U4Sf5lJoVlMvFwB4czPqdvjyWS1FuIPQX2oL1A6AI96
	ExzSRb5y2bPn6No8MDYTyfKCMlGEJEp9blGcNRSL2/+dclStj6+Bnp+3fnOb8/AHaJsmYKmhLeC
	uI0hlfhx1U8b6tjED1BLa/vJ0UjVrYIMNDspbMNf5i1p824wiXagsI0IsHCxPrFbRRYKmJaRYFj
	G/R758KwKZIhifpfPGOqw+ENSv5huwlbtphmNN5T/CtFm7H4OKc+OTdYiMzhDFy1qTprL5uTi3M
	rtslm4HEagD0v8v/jnblhZCIO2bfo4Fsj4+dTAsrEJFNYF72Ooma5OEyc1RHblcEMbADXRswXh5
	4g9XMVw1jgZQ==
X-Google-Smtp-Source: AGHT+IExJ3Y6vsO4n4lk5WP0EcJLY+A002SLr5TqSrJhm/5JkLkja+DaB3kdCtON/5vWHf9DwT0sbQ==
X-Received: by 2002:a05:622a:1a82:b0:4e2:f1b3:345c with SMTP id d75a77b69052e-4e576ac1313mr1169361cf.50.1759425848090;
        Thu, 02 Oct 2025 10:24:08 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:07 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 11/16] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Thu,  2 Oct 2025 17:22:59 +0000
Message-Id: <20251002172304.1083601-12-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses from a function in an if-condition.

These parentheses are not required and violate the kernel coding style.
Dropping them simplifies the expression without changing its logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 14015541557d..74dfbc7a0c26 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -730,7 +730,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
-- 
2.39.5

