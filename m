Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF0101EB
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="J6TowJcU"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d9e62ff056so263558b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520582; x=1705125382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YazXYBV00NUviHMUP5diek19QFt20KFYBc0SM+UoYHc=;
        b=J6TowJcUWm5LPFmwgfMS+kdrwu0LHtrpYYHXsEXYc/ptz469LQRcW+9ZewrjFOUdP7
         iuRxzdVwbzch6xIS+0f0s47ibNV8j4KC4Hi4Mp4PebJpsKH4zl641GM65AaC3YslHOPi
         kyOWg6+eYfBaxXsmwW6asqTBkW8/Uy/MIjbqO0CbFtav0oIpoQDe22aRWa4LYTJBOLwl
         nUhyWEeYvzggo9axh/wrYNRZyIJI8VYClu3MLoQ19qmH3dMCtfklrL1CPrswGaKShoCc
         uEP9pr9B5t4nEqSRwMJ1xiowen+1FSLyiIYokn8EFZiP4bXrDZlEbjqYlXtQUG07G7h6
         3Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520582; x=1705125382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YazXYBV00NUviHMUP5diek19QFt20KFYBc0SM+UoYHc=;
        b=tbincroXyAaD+8YhQGO8IoD9WJDXaLYyjnkiZe4N1Am4Rj8vv4ZE3wSzhZcnX0gUM1
         GDlUks2dmMZ3mcvIapqkC0nD9ZaLtQT/F+VvTJQ0eNunHM4RpCaZi9pgWLp5ef90ccua
         rLKxJ1U7XFLQQv4TsWukmSPdV669eOJlYc6G4cIj6R0GKYO0pzALzcbTuCm1v5XgLEWx
         hoLGhD0u/wM9K5G64kziIKkGCRnGHMUphgIdNlrn+TasyQs23WprGlkKcHETLpebptup
         sghQY1aeJbEU6obNUQ7Mdud16pX+odUdVoqg+fQuC/Lbm7gm0nVNxKAIa10rebb0ZNvf
         qTkw==
X-Gm-Message-State: AOJu0YxfwW2td6nuvqKtBQChyU93V7+EhzxYWhZIfXm8wJoslye1XSEL
	7RKpln+cYwGue6Dqcahl1603aKuHblJ3jQ==
X-Google-Smtp-Source: AGHT+IFI4X4pVxc+VC1ljTNtP3J9gSJFFVFxxspE37j1jX/QVdxXH5sxzF19R7+HEDqXq4qnLjxIQQ==
X-Received: by 2002:a05:6a20:840f:b0:196:8a96:e558 with SMTP id c15-20020a056a20840f00b001968a96e558mr607247pzd.92.1704520581816;
        Fri, 05 Jan 2024 21:56:21 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:21 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 16/21] Staging: rtl8192e: Rename function rtllib_MlmeDisassociateRequest()
Date: Fri,  5 Jan 2024 21:55:51 -0800
Message-Id: <20240106055556.430948-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_MlmeDisassociateRequest to
rtllib_mlme_disassociate_request to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ff43697768cb..7c5056f9f6f5 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2241,7 +2241,7 @@ u8 rtllib_ap_sec_type(struct rtllib_device *ieee)
 	}
 }
 
-static void rtllib_MlmeDisassociateRequest(struct rtllib_device *rtllib,
+static void rtllib_mlme_disassociate_request(struct rtllib_device *rtllib,
 					   u8 *asSta, u8 asRsn)
 {
 	u8 i;
@@ -2272,7 +2272,7 @@ static void rtllib_mgnt_disconnect_ap(struct rtllib_device *rtllib, u8 asRsn)
 	filter_out_nonassociated_bssid = false;
 	rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_CECHK_BSSID,
 				(u8 *)(&filter_out_nonassociated_bssid));
-	rtllib_MlmeDisassociateRequest(rtllib, rtllib->current_network.bssid,
+	rtllib_mlme_disassociate_request(rtllib, rtllib->current_network.bssid,
 				       asRsn);
 
 	rtllib->link_state = MAC80211_NOLINK;
-- 
2.39.2

