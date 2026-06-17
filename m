Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3B73B6BF0
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 06:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781678584; cv=none; b=U6DlFDKQppqIqEt/Rk1eKICd3hdBxpviYGi6kQAEGyMCMyVdpSrCvFFkapGDY7GSgk1D/aDb9ZTnCdXCsTJXvGmAagHnq2ZqSkF6xuDqJuiylyVKaBLqDM81Yf1moyw5k9Wh/wFQRgZRkPXYMmPoJ9ZqfiTtk70i6vAvtCVxqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781678584; c=relaxed/simple;
	bh=SmknGfcPCEw4hKSjgWF/n1IhOIpQq93t/pOlrkuF9WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfWJxpeHJ3L602LCMOt/HOyjEMRPAhEDDbZ2A6pTqMSdRzSLg830EK2rJ2WBR8agKOrvYyUeiUH3eEShdb4TVD/vqVyi5FlmNuHpllLpLtS/Ixyxg5RvS0/2TZ7JbpQz27ShJktbObMHF7DK/WJ84OUKJB8yEBSxXn6BDNm+sW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqMBZ1dX; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqMBZ1dX"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8629bed4e7so3897008a12.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 23:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781678581; x=1782283381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rw7s0CT8sOY47RXMxa+EbrqJwZgLLe7KYHCVHkCCbg=;
        b=KqMBZ1dXa//FFK26V94z7w/ntShSjjUa7lcnuLIkk6nrFSB5pbdGRSBqdLOsOACxxF
         pl4sKKg9g4DGLUnPB2TaYYjo4jDNeHv7TiKTbftte8kmmgVFtatbIPi2dHdPPU+wXWXN
         M0lVamKE78apvkBIGjbFdOYnqbzev3eTYMIWxy4qcrlOrfaxSE6H9oIL2R20ZsL2VyGL
         XmYfgkBqKivp6dsfNLWxNTMWs71eb2znxspIywjaye1VXCLkyKct/asBX0mAX9OIb39u
         5bb65xXD2DoHokVtEkqJzMLALkseAvoWzsD2E5OrtrVUU0LvFV0xEO6JAANct9RKDDFJ
         2sLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678581; x=1782283381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rw7s0CT8sOY47RXMxa+EbrqJwZgLLe7KYHCVHkCCbg=;
        b=Ss9rOHaldJpi9T9OOj+U6x64Fy56DEhqWBSdrfULTC3en7aCoXTJ84ieWSLSNi7l04
         Py1Ik+Oz2i8M7Wpp6nyVfcYFc/1kxUhmAqgIbnh2ebKcu9P7tDN1FSEJN9BnCe4cAya/
         c++ul4afF/ZvNWDHTioQyMziUZ9Vb4RnlnrpP5mRtH+fGvrPk5jiGNaLVKd/bnBgnBje
         aRPnsHBQZ06FSCHnIajESdQisWf2jVVleALLYgpyAlF/fK4ldTg211EtDAkehuD8X85O
         9rL7cuBQ2LHn/mx2uwdyds1POVgu3R70cstSzp5PH7jus4IyAE5qO2U8M9tFPRRw8MCM
         MZVg==
X-Forwarded-Encrypted: i=1; AFNElJ9iDUlUtOrJVw9Yp7Hocq5d/nPJ0DNuZmYAMOELuSPMI/N+4Gafh+B2kx9HDBOXBZby2o+Sdxez7dd9PAur@lists.linux.dev
X-Gm-Message-State: AOJu0YwFWjRv/I21Odo2U94y47RmOK6POdv+apeY6HIfFuaZy2PvZh0z
	Pu60/paupdIpJxWBf8mwjYFUhwqin8cg2WTRMg1p/9p4TOxJHY6aDsmj
X-Gm-Gg: Acq92OElO9t0gy6+aBj19alWHp0yHGj4/rELqXmv2AqQeWJ/yEz/wxws89tsTEBEGMb
	Xhzj0ibhwncrgWjKyQAyNjwHBxRXdn67N4Cb99S3NBIeyLQA66EYzYhiy4huaK9u7cn7ywReCo4
	7+e6cWmG/WhnYza4xzO+DImZ0WMhKtc0YllbftU7tKpGoJquLMie8tpEMxtJGREJl6Rg56a9Zic
	pVPb26uN2uwhn0wxTxvyEKInOwpWFiFmpd8zhptoHGmgiw4IK1KFmu/2KbGp3byPayGMvYNrbKG
	H4NJQRXNEzcAGILmGz5sgkwDAHsUb0BPPjd/p1fP6jZTfx7cgSjNkgevEa5BuPNVnfvFW28N2Ev
	spBjtjpX/yl92XJh9BGHF2r2aDBj+EMzGK+rj3nZsL2scpmZC2zu0vzQwnSegfOT7nJMT47+lhh
	fA8nDqqe9/1ix3HMgRtjGH86VkjbDG/jKX9bKtEU7sixrV95AsVUrWgY2Z8aUsPYmcY2DwS0shr
	A==
X-Received: by 2002:a05:6a21:50e:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3b8b7cd919bmr3129363637.33.1781678581396;
        Tue, 16 Jun 2026 23:43:01 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d156sm13738985a12.13.2026.06.16.23.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:43:01 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: Fix indentation in enum in rtw_mlme.h
Date: Wed, 17 Jun 2026 12:11:49 +0530
Message-ID: <20260617064150.16078-2-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617064150.16078-1-subhrojyoti0609@gmail.com>
References: <20260617064150.16078-1-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enum members were missing tab indentation. Add proper tab
indent to align with kernel coding style.

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
v2: No changes to this patch.

 drivers/staging/rtl8723bs/include/rtw_mlme.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index ac3ba746b64c..403c097b46ef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -44,12 +44,12 @@
 
 
 enum {
- dot11AuthAlgrthm_Open = 0,
- dot11AuthAlgrthm_Shared,
- dot11AuthAlgrthm_8021X,
- dot11AuthAlgrthm_Auto,
- dot11AuthAlgrthm_WAPI,
- dot11AuthAlgrthm_MaxNum
+	dot11AuthAlgrthm_Open = 0,
+	dot11AuthAlgrthm_Shared,
+	dot11AuthAlgrthm_8021X,
+	dot11AuthAlgrthm_Auto,
+	dot11AuthAlgrthm_WAPI,
+	dot11AuthAlgrthm_MaxNum
 };
 
 /*  Scan type including active and passive scan. */
-- 
2.54.0

