Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41162BE642
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604116; cv=none; b=UUq/2hnSrb1auM5+k8mXuXZY2w3oMfYjkRRrSW51TDaxGlkWrTcDstOvJQVqL84xJ6W7GHtb9TWRYAsypaGvs6DB7lLSNphL0W2jzhRRs56gv2MP7X008EQnArKcurQz19xj8CxD+n3fQ2pQs7+IlkYFLNAY5QFQIKgq+0wig5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604116; c=relaxed/simple;
	bh=2gMWcrlVP/2PMkXpsqACwdxWoRmVnHNKMopuvTPlXyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4/7wSa7dSsWdFWQl+KPZ42jhRU6VyfuqSTQW1ZbEb7/kKTw1N+CoLXDhJAH8XzH/EDFNXuUmOFfirW0V7EPKSG44//4XcY/zH7wCFf7grRanVeddeUdBg88pX4NeXzNlFzU3z3QCvae6iwuqurnoOk7Xc8Xdtc1o63aVxk7SLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmojLauC; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmojLauC"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so10890543a12.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604113; x=1753208913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoAgfdpj6XWO6IsqKcPBce5kLl9KKg9mYA8xl0WEpR4=;
        b=hmojLauC91+h0UYJATz15yVxyWuIa1ocBwcSoswyEqkY8HTOmx2Ufuocd5LmpQ8EJG
         zqQPt7XH9SQVygUSKlC5W6yqzyQUaUDifcn9KgsKVV1MhSdTF7JB1rSRM8/6SPCcDnhN
         NiLRDGKx6JtlyyAtp5/L+fKWq2N5BvdQVdk4vFqqw3Jw7uEz2bpweD6m4ZTkif4rhirz
         /DFRxvmDXr3zptcTxwEfRdrBCEuaa7Ug41i/mRuS9toeLPD9LETcbWLBK+FvkJ8oQp/B
         hqwoOXO4Phltwut6d4lJHCZYnHmtleQnhBmibz+d/ICKpUakDrENnAki0WxSB6GNtas8
         trIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604113; x=1753208913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoAgfdpj6XWO6IsqKcPBce5kLl9KKg9mYA8xl0WEpR4=;
        b=IRoZwg3OTaTPVetmS+f+6BzDxoDBeyr62MfdZG5+puGrhbEGMOOBcic8EX+Cy0HhQJ
         9EKt6KpmCZVApNCCWFbH8hPdQtpBGJwN6aqJzM8GQmcI1l5lLd8i2ASHB6ZyR7wcKj6o
         PvaTYCsnV/qdkLZhsnTJ9T5/NiJHz1btadOeHRESzTnQnLurjUq/AaNOiK2H/piffKsE
         uDr4PLhYnfByUoet2p4K2OR9oG8609c25qs6mF0ZVvu/otNlCRYhaPu+IEKYk2rWQHs9
         QmeEja4yq8DMda5KNJDLYBZ3JUuU5BvBFtxatqFv818iRuKfc+YvsOy8Bajjy0jNjMm7
         NqKw==
X-Forwarded-Encrypted: i=1; AJvYcCVnrKJDi9TGlo96zz1hnHVv5E1v9tzaVD1+crBpDj/kXQzw77+tGirHvQS9SGnPDmD1mW0H7c1Tj58yQ2US@lists.linux.dev
X-Gm-Message-State: AOJu0YxXZc2ehFK3p1B9ohHUWQ4893OPz5qVpITTNofSuzFWjz0/jG2i
	NhVEWbcHzyr4X/v20W66go2td9ypWH86fAjK1M7gVULYoOHiw96TFiAU
X-Gm-Gg: ASbGnct7fdAZ5TLbOYdcUeMjjGOwvAAcblnn/STBGlyotYR5tmk+ux0zMIfU29QaVGI
	TkBiH1MJmpW4NyRl7A3S4oqjy7AcGu2HakBENyecSTQryPXAzYt6UZaKa2nr8qumF1bBdeVSUCd
	6smQMP/YZb5qsQXPzbMVH6hh6u4GOkqh7sGrU/tyhLjT7YkXBL/P3kB1xjTWRewhj7vYht9aaRB
	IwJqj7uzyjibxrs8RQZ5Jwm7htp4bNOJP1ZMElSeStKsKaWAwTX3fNN32hcXUZorhuj6bG/7bhG
	zlNONFGZ1S9jxPSid6/t+lRwI+yOHqAt33WoId0ycR4KHpoe6RZfuJcHXcPbAwJd6fYA0jPSaK8
	dnKFIQsGvqj5W2kVrGQE49sQ=
X-Google-Smtp-Source: AGHT+IFsjvBQY2CWoei5kxCeOEhLCE17FpzwXWJjBu67npFD0/1jEC5cSYFcoBr7I2N3ku2dsXkAkA==
X-Received: by 2002:a17:906:7308:b0:ae0:5137:fc44 with SMTP id a640c23a62f3a-ae9c99957d9mr62812666b.18.1752604112768;
        Tue, 15 Jul 2025 11:28:32 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:32 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/11] staging: rtl8723bs: remove macro FillH2CCmd
Date: Tue, 15 Jul 2025 20:28:08 +0200
Message-ID: <20250715182814.212708-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715182814.212708-1-straube.linux@gmail.com>
References: <20250715182814.212708-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro FillH2CCmd is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_cmd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
index dbcf01bbf051..0665c4955936 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
@@ -181,5 +181,4 @@ void rtl8723b_set_FwPwrModeInIPS_cmd(struct adapter *padapter, u8 cmd_param);
 
 s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
-#define FillH2CCmd FillH2CCmd8723B
 #endif
-- 
2.50.1

