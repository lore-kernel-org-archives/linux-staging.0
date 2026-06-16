Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF8643637E
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607681; cv=none; b=lyb5glLsVCwMLHrZ60X2BYnxnItnjvRjVKGUvqPqSPpYnLizSx3DtSBfRIyNf8IuJHGrYwtpeIS4WzZjJJm6bl3xN2JbAg+ACKibLexQ9nCQUpPFnBz3swBQLn0ceV56YcbqAL50TmNrEmMSjJQR2qQm5t3u9m4OyZRuwIN3FLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607681; c=relaxed/simple;
	bh=IjLioQZ6REOdw5Pf3NMhv9xhs0fyRU6T0P1vBD0rgY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVBsphbeiXJZ9OiuJLF76zrN7vrwH24gjUSJvdUR8G9W9+bgTpfazeghREUXPhAIpIMMbybbs6+PBDfzFaLMvH34T3rtgc0nuDYvteuoZxN9iib8asgxVYlaNy28JRVXW3ctSP/cD5cb/+E4+HkrLnBY7QhLVzGT2G2OAofbPmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBRy9pzA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBRy9pzA"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so2807458a91.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607680; x=1782212480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8B7+OYWzmeaiE6+txOrPbNbByamKxj/fZ7gCf9iwIs=;
        b=EBRy9pzA58JGAxBsQNKXezpqtgsZeDi0pCzw5wW+EVT49m409U61BxPwoI6mpG1Kq2
         P6LOKNZwsfxoq7dFapX6dgI8eM2ULEqe7BV6mQCvqtkcyuhUJL7aPSossOHGWAFmDBwl
         H+nu+2klDNumcexYoATk3YZpr2cdrzhVw1OsgQo+QKS9chsuionOL6XWek8s/E/a2gmH
         n3aNwhpPFgNtnd5Yo0MhoxcmQ39wlGxAE6BZMKhnjy++Lo2wmFLBZQLUHEBBZ+VoHB6/
         7bkLeosXsl6k0GxHAkMsWMLgV9janOYpB5gKLbfXhHmsus1mp9G2i1Ym9roSLLW4M5Kz
         pYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607680; x=1782212480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q8B7+OYWzmeaiE6+txOrPbNbByamKxj/fZ7gCf9iwIs=;
        b=i0mmSNmYY28KVOVUcE1GeB7MeGl4cYN4gg/E/NfZlqFLWihicAfZeuEDwCns2Z+t5x
         28/8x5+oKxoTRYwI5F7G8hEzX9LPjmdBsahgVrfrZMfBAYrjLxLj0Mv+z9cRAO/3DoYf
         FP7skxTbzHkoy2O/YAeuoP2NzFaIGUNEDrvrza1bWwN3ZFMDoGDVpxp1WTSFVwdVIEjT
         /JNHnejPYhmTJTJ6hezboj0U2nnj6LRp+52sAMpUCN2RXB8dZnD2FRfUPENOI+M2fa/7
         LT2VqYGOYvDj18o0x3h4tdtHuA0GjA76Arijmat/wFwek3vCLluMbEu1wDSF8v4TQIRy
         8Bng==
X-Gm-Message-State: AOJu0YyjdLL94BWNLh4TtxhKYU49/n8sV1LjuR9k08zYc18VDv8Yr/wz
	rj6mdAyZvLtapQZPMQAdakwwXaR5Od5OsaOf1cHqG+t7dOgILf92eg9Y
X-Gm-Gg: Acq92OFP6Vz51s5eZB3tAjnRpvXLRschuE4x1qudxV8ufZs6mgIMh1n9Jk+170GI72G
	IRU6x1UAm25hGvbfUc4lJBGWhzeKpPoO3FjGiCX0wzKUrsCZNDDQBGsapFgbBDL52BEWB9G51Bh
	skZQcuUC3G7Vbq2VPUqOSTfYMktjhspMbizV1ujqMsWf/EzHhbW8UHDBYWFcJAtyB9UFeALSIWl
	OU7xxR8fAbAJGZJ+t+AtIWVh1PkWZwZlU9bXkuYXWqWyebeMsN3FAAF98fjPsbJroD+oKpbazgZ
	YyTAWxRrzpIqdrHgnHxDY2ATbdXfW02yViiZhVPdqmlbLbZhPrHEWeNwgg8IvgUNXr/3cZSJtig
	jxzRB8oozEHv6XFzT8ebsTfzLQCDdm0qWxbUZS/te8r9sGNb6L5JYcWvRNz2kj6G+WWta1IfWSe
	VmdnOGRyd6iVs2uAntBymLCQQ=
X-Received: by 2002:a17:902:ef44:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2c6a981b6demr6443265ad.30.1781607679999;
        Tue, 16 Jun 2026 04:01:19 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52a9sm132561995ad.11.2026.06.16.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:01:19 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: Fix indentation in enum in rtw_mlme.h
Date: Tue, 16 Jun 2026 16:30:45 +0530
Message-ID: <20260616110048.45541-3-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
References: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
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

