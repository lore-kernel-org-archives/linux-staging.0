Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C6E28751A
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753860775; cv=none; b=b7VViVgRlhxZndWfFDG8gtcT/0lEEfqmQ+H7eSnnENlfzoemkhC53mfgpvRrvBg52RDGu+TaFrVjAD+knL+Cpz73/T7SVmwtSzM8MfUO45Wv41NdUlXo+pRr71f1L8/ScHpOVXVGovVGOTUyXiBtlzMpo6m+nPpt0hRahq5dUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753860775; c=relaxed/simple;
	bh=O32Ie8Am603046JA4arS3OFon7lXrwsdPMSnmBgjKFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ig0va5RFYVb/Cl+87JhyHsYLqB84ZyMl9r4mVAVEN61y/iWMivUXNxRkuZ6coeAcPUfpvmfyrJS1lY7sfdUoOnmI/oFZtWnL04abbIkqauqKatC1UoCevYWDmN5AyXf14QIlBwlI0A0cimnoS81b9RUR9/DCTXFEIVY1hpwXPis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrQSogvI; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrQSogvI"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab6e66ea68so74319871cf.1
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753860772; x=1754465572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QgyZUt2WJh4tQvZzl2B9nRznrnVSTuASTHr5LO7G+E=;
        b=TrQSogvIVjhdUQuts32LVv1ljDV8HnOJ/WLdjyeiXntPHPDZDg/4EzDWFcYZZo4t5J
         Tsvxbk3iyTY8nn3fSj+tlPmmDnoinX73f4VdNom29x0MSqAnbdN1Mc/SqGYc3ZEFLa9m
         qkvjVbELc1DTHPKbQ5NkBKsTDXn8GXRzUaS1oZlBcNfbbiLxDcJTVUIlHIyWB8GFIMj5
         fa2XQEaoijXe03SgdZEeE0lKMgrLDt00YungvjfTvW6g96HJU3i7ddon90s7XMM9p2Dy
         3/S7vW+Uk77CaD7uQ8657bjZsjhtLqRZaNs/hLVqXMKsb9Z1MHTtwzfBa9k/OxZhqs0c
         Jjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753860772; x=1754465572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QgyZUt2WJh4tQvZzl2B9nRznrnVSTuASTHr5LO7G+E=;
        b=TZC5gfgSFA1qAEmF9AYlSHxvTW21VPzdhEdzJf73Nr+sSLp1Crtymkp625qAn8uF5C
         i8xKjDW4SK42hsMSj4xWPIsqy+KtU1Py8fSRWy5lqrNUW5M5xRlD715FCfvjBhnU/aEy
         i9HXQ5pY5HMm9mv6c0oPcF7Z6jJyPI6cdczSkc9SvZ600Hl4uEpFIQxXc+Tqae610+Es
         EbthWTvfwghrcp9wZ7izH1Ji+MS/z5Q/f0nFtp+yWRTrS03F1iUTBQY0BS9S5x4tU685
         guFt5iNv4dUdisWpUnRZIzbP/Ca98U1Cxgy3Wb/WkPCT+O+BKPXm6I/zr/qzhKRQmzI1
         esLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXnUY1uV1yU9D0kIVt4KFkRMQ/HFusq6AO9C2xtBsF1vtpF/TKc27lSmZsdR6p+oz+OZ3/v7hx7zIpnqfj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2goTV0Of1nMdmR8CqkiRlXL/6q6nU6bG6Q8zkgd3cjHiX9I3d
	oWn6QQwwU7u4XeRf3truXaF8R/AZ1Zv9/QmrJv186ZDM4vonrUZjtxnK
X-Gm-Gg: ASbGncvE3dK9DcMXZG2URahLMQhmzPq3jYMu5BSDlnFwwZhV6aYDmESLuaeNmDaKGFK
	EZNVY3IRwSSvO+0VJkVNkA+ymmThY7AOYiv/UoDVLfUULaRU2dlvNX3NJNoRxpuyz1/wmA1LFcP
	AQAAunFfenJZZ0D5QhBpNl7T0Sajx6PIZ9POEKG8C2oT19bCNF7qpRfiZ0Z0KLwxLbBQfkAdVs1
	+/F3pdgA/jGg9PHJdvDTxH8hMfUH+lImEtaf8kQgJVamrrZ21ol9btPFiYbB0tkC4wN1kQCt30c
	GFzIrrdcJQRXUTpclFAfm25E/ugexRq5Q6b9zss2jSUCCpu1po+iTRuU6UfIdRt7w4bWS4AcMPC
	Zzst0DwfwhksB0lJd62NNRX+KwID/1tamAXm140MVJoXAi8RSSyA=
X-Google-Smtp-Source: AGHT+IHmqYte3ijgzk02Zta+BjezQKmqmxp3FWkE6qrzg1Mtefch78YALl0dEgAi+oR4A+BIuxjeyA==
X-Received: by 2002:a05:622a:394:b0:4ab:417f:aa44 with SMTP id d75a77b69052e-4aedbc59df6mr41746121cf.51.1753860772151;
        Wed, 30 Jul 2025 00:32:52 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae99545512sm62680331cf.21.2025.07.30.00.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:32:51 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vivek.balachandhar@gmail.com,
	Markus.Elfring@web.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 03/20] staging: rtl8723bs: add blank line between rtw_roaming() and _rtw_roaming()
Date: Wed, 30 Jul 2025 07:32:24 +0000
Message-Id: <20250730073224.490578-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730042032.488456-1-vivek.balachandhar@gmail.com>
References: <20250730042032.488456-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the definition of rtw_roaming() to separate it from
the following function (_rtw_roaming()), improving readability and matching
kernel coding style guidelines.

No functional changes.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
v4:
- Changed the wording of version from "Changes since v2" to "v3" as per
  Markus Elfring comments.

v3:
- Moved version change notes below the '---' line

v2:
- Moved the '---' marker line below the Signed-off-by tag as per kernel
  patch formatting rules

v1:
- Addressed review comments from Markus Elfring on changing the description
  of the patch regarding readability and separation between function definitions
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 357fc6a56c27..f8680124ce24 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2449,6 +2449,7 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.39.5

