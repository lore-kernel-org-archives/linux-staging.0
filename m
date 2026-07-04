Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB73126D6
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 06:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783148308; cv=none; b=FbVrUURB7+Pl186KXcB3uwgIUVL/lIGtXb3nYy57UYJBqWXvaZ3sIuglHd2EI2MHOrrdbIJE3Yi0vHjA8nxTMU9gBTZcO/FiZgIHT5GuLpPKZ83eY4HzVYKeBICKeXgFkgE9TzPvam3oTbqpoXzL5z3N3ltykYkqe56KxcK46tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783148308; c=relaxed/simple;
	bh=0Ql7R0chKKnSTLTalEhgSVivzAge5FzmNSZ6cbj00i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSMcLtXygmuysG4c6LF5Tcjc0vOGCzvxh0x69l+5YAKffjR8hNChikmbguI6k22OKLlCiDspAMomkpXou7T4Vgdr8ab7mQyq7LFUGNVz92J13JPrrWMFwhhfoIS4uvXpSalPo0hn/DVaLCoV1zX1chUxYp39lfcTT2Q1DjdVMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrLovYhe; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrLovYhe"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ca1479dfe0so14111535ad.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 23:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783148306; x=1783753106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk1gsSzNyvLyGL3wQhMLxqEWyeTVD6LK9bSQUeXZaTk=;
        b=MrLovYheEyKu9T1zm/XQKuuIlf1FOPDf93Wc30Wq/2H6K58tymEE+OsyekwqYcd+PI
         ta5pf5Xmsv8lS38oeTlSuWuhFe9W9gtCOI2y1D7nsIYf29lMK1JZMoxNATYJ0ExCtpg2
         R2HW82QRDFYJibb91cxF6EBdGTVUgekPFYpWhzXeDk6RAyJD9EVVh1ntF1a6Q2Ghx9B+
         AjWy2EofdXGEXDdO7PtWbnrNaABr8n/kKTqigi0O9mZ+CtsfKsH4ozWp+qIoIT4AVWY8
         YCHJm5EJuoqyToW5r26Y4iG1MUuoccYlk1pF0xS58w4wP+3cW8U/e6VuHQqL0VZG4qAP
         n/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783148306; x=1783753106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pk1gsSzNyvLyGL3wQhMLxqEWyeTVD6LK9bSQUeXZaTk=;
        b=lbYGBkjHtlPMNoCqAERNEfaViiOaFQTVY3Sy/C2+6S28I5SBAhIle6ORUYPyr6jdzf
         xdJS/r9fixZa+FK8rs6sRtKQvdw3RKYqm1iIL5fFUDVJ+jLHy5/JSc3wxxg8NTrb+MSS
         s/fxp7+QxCuRNVK9KaPR96ddAqvHV+MVAzdZY2auJL98zqFo9cU3yHpTMKDqWlLSQ0wy
         WTAkdFuCLWcsX/bW0yAnufRvRAEUarJubQl32Xw8UqqcRNdy7mmzokE9OPJfsi/p/YBl
         WSiRSGLe3TR8n6wxBZ9is4qezDhaC0gf8nnlKh9LADgZmZhKlGz75Ca+BMEzaYxMybDb
         kjcA==
X-Forwarded-Encrypted: i=1; AHgh+RqmnQxPwlhxhpFABGC66wOQK+WPxYJ2G6zlC0mTjwiMr73FZl8v21WqgGoQ1EoB/TwTFocgEmyPOYpKwuSx@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+tEBgPSa6DAZ9UJv+icWvSsqA0Acuz4rcrhUrAJX0ssCs7U29
	W6szZbvPw/sv6UnCC2f+Uw0ENC0faFRyYhlciWT/2RgM8TLzhjedSQjt
X-Gm-Gg: AfdE7cnnvhiD/wIfgU87jYOY/P6r+REm9B6ZOEet5Lil1P9EeHOV6zuweEzF/38BHE+
	Tnn8Pcz/TOMRceUcPA9CZsMpsdNuoqSUgljWwL7D3gHPrwYs2FRmOmyWw/kQBSmzOA8ZbQXxftH
	Giglj4svXJWYUPdA959/ztEQQMX3OasHFG2mbznOyCqarBk1DqTobpmiXA0jABSVxCqACVlPhhh
	6KGnI9wx6NZ3MozYEmHroTS1hQyolBeYPuS8hwpGEk7MdraDph9VT43kL8+tjrcJ8QvoZVnKadR
	cTPnzeH2C35KcbpinQiI/Wc5tuIHR3HExnRMJxRNSn8/Oer/rcmPakTVH+SrW3C+ztCgap6Ive8
	4OSXYulRL//3YEFjr63cNmfcOJm5Vum/wq/PXiGaXlNcU+sq0OuujVo8rIZRFct6EjX0OEtQuUq
	8k0SWnqAao040KjqoPX850VY0doWRyV8KTXA==
X-Received: by 2002:a17:902:ffd0:b0:2ca:feb:303b with SMTP id d9443c01a7336-2cbb9ee4ecdmr21754205ad.25.1783148305926;
        Fri, 03 Jul 2026 23:58:25 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([101.12.233.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad712ca17sm19526275ad.28.2026.07.03.23.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 23:58:25 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nadzeya Hutsko <nadzya.info@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	stable@vger.kernel.org,
	Martyn Welch <martyn@welchs.me.uk>
Subject: [PATCH 2/2] staging: vme_user: fix location monitor leak in tsi148 bridge
Date: Sat,  4 Jul 2026 14:58:16 +0800
Message-ID: <20260704065817.403111-2-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704065817.403111-1-alvinhuang0603@gmail.com>
References: <20260704065817.403111-1-alvinhuang0603@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tsi148_probe() allocates a location monitor resource and links it into
tsi148_bridge->lm_resources. The probe error path frees this list, but
tsi148_remove() only frees the dma, slave and master resource lists, so
the location monitor resource is leaked on device unbind or module
unload.

Free the lm_resources list in tsi148_remove() as well, before
tsi148_bridge is freed.

Fixes: d22b8ed9a3b0 ("Staging: vme: add Tundra TSI148 VME-PCI Bridge driver")
Cc: stable@vger.kernel.org
Cc: Martyn Welch <martyn@welchs.me.uk>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 4cf3486646ce..c695ad9b4ca2 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2534,6 +2534,7 @@ static void tsi148_remove(struct pci_dev *pdev)
 {
 	struct list_head *pos = NULL;
 	struct list_head *tmplist;
+	struct vme_lm_resource *lm;
 	struct vme_master_resource *master_image;
 	struct vme_slave_resource *slave_image;
 	struct vme_dma_resource *dma_ctrlr;
@@ -2590,6 +2591,13 @@ static void tsi148_remove(struct pci_dev *pdev)
 
 	tsi148_crcsr_exit(tsi148_bridge, pdev);
 
+	/* resources are stored in link list */
+	list_for_each_safe(pos, tmplist, &tsi148_bridge->lm_resources) {
+		lm = list_entry(pos, struct vme_lm_resource, list);
+		list_del(pos);
+		kfree(lm);
+	}
+
 	/* resources are stored in link list */
 	list_for_each_safe(pos, tmplist, &tsi148_bridge->dma_resources) {
 		dma_ctrlr = list_entry(pos, struct vme_dma_resource, list);
