Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5E02BF3CC
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128635; cv=none; b=f9baurIwrWQdceHGs185k8a6vELx99fehxuyPyNmQpYM9JBJ9yfPPySDAenkyx7/L+/c67ZxiDjZT8arkgbmvqY7Fxu5z5y2upRvi2ykj0ucb1hIqqQxm77O5tIsB0OOdzXsvBtHi5pJjAW9xoFf713HFkUJkyC3n6t3fi0sM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128635; c=relaxed/simple;
	bh=JmI3rvfGEf1Z1riF8sZuENvE+ZlBl4htm6xrdJ3xaEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ApG8toE21zb010gDPcvuUR+O3hY3f1rj1wT+OmfbDubca7pOC6erelCXK8XpX4QIz9ysR16+GOZqjQ5QNsnPmst9WCqjqzXg7RBMH4ocoOWXn9x6V37qFfvHwvi9AASjmdO5TPiPu5F+7wbGDwu5YWy8zlws4ZoJxJPSSwxJbcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yp0EIZkg; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yp0EIZkg"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-862cbf9e0c0so233300885a.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128633; x=1759733433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=420xhJpXeiS8O0VHfKZK4Z2TaOUNPYgxom/AXLmk2uA=;
        b=Yp0EIZkgVfpuil8hQHoJXAjcW40MjfE5cOSp+EMkiKWSyTbJRWBLs0MeGy4tEsNwoS
         yng9LPlpjlu6OAcOSDDrSsUQEAZ/6E2ODRbA6pKeEpq0u7+hZVJVOthNiWQuKP7aWH16
         FRRiMovfXHkjUuqxxnk/ZMOQKYNJgUQaKLLQclJOZwlHkPryZj47+IP7BWOjfzb8v+Jh
         /tEUoCiYtp9rRe+MlIaABIh9rjvEAfo469/QSeuWSRonBWEzPpxi6HKboUMu3T/O/1Gk
         abHG0ldUtZgMHHarBSxqG6hCRRNtCFFKocTqIVQB/CPdm9S6wBq9J1R1WQ+ZpCHcO/zC
         nPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128633; x=1759733433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=420xhJpXeiS8O0VHfKZK4Z2TaOUNPYgxom/AXLmk2uA=;
        b=EuoNt6NJamrE6qkPZp2fbBFsIc8qUL/M5KuiLIa/q7GLlIDfHkluaFXbBvcBApZK5O
         5uRHYDTPZvRty4c3nesI1fIb3SMEZc5PGL1FfTrhRVQ7lrlsbq/+W7G+35BdkyxSDoyn
         pvah6ZAvGdCeYDck56FV6+hApfRaZeyt4RsWv9pgabNa8ZjscTKb8WzBMhmO+Cl/a4mo
         gVFjg85KpZoLwy19+g774IfC+O9ViTmp8QU4w9cVB5vXzdELDElhlEvjgL5I3A3HKXKy
         9z4sIjOoWRywxZz4wXbxvyaYuSkkVBS8S/oamjRgIvugY1RHwb33J00QkYBymXMdmSLa
         hcqg==
X-Gm-Message-State: AOJu0YyXgN9/fa0OhwRY3fKW23JGReYf7yfP6D9FBn45s6RmgyD08yFS
	UXfQYFtMbBYdoHbkdZj+Eu5wCdBzf+XkNsodcekxe9T1QgOuxV7lBlQjpazSdg==
X-Gm-Gg: ASbGncsrORlJ+H8DjKF/yl9UtQAC7lCPxGcQ2DXbpr7enAh2WkSgFoe+kLWNT3NeqM3
	GJIbW9WWytiN4fRyTHIob12rTAGJtLNQKKWk65iaCluQsmwyvEdOd+eBY/AXhSPlbH9wPl4YRL6
	2bouUV+R4c03mE1iyJeHL1z3O6FqxUcnc9p8/e+ZHJ6Kp7+e1QSOWxZslLac3qji1CmzgH1IiHj
	iKEoypGYEOI8/udA5mHt7HaSvx7gDP65aEV95Dy2nvK0yQ5vFf+b1zgSB3qeDm++WNLVfKc8UHW
	emKIS7MGYjx1tSb9J/hzZ8BAVFKpKxCXBWQsysAwqmqRJxUXdIiW2Pdno5JD0PsME9sidKOhLza
	2yOK0f6OKQDcuLGYP95zxS2SqqVxOQibm3D4eet33JpPq6hlEoXE=
X-Google-Smtp-Source: AGHT+IFOQPBsC9e7UI3wqDCezKEuwKs2i0wwj9znekjUcnXwC0zeecRTk/Pm5T+vLslHnAzLialU3A==
X-Received: by 2002:a05:620a:1a04:b0:811:d0a3:4027 with SMTP id af79cd13be357-85ae7156ebfmr1949751285a.40.1759128633014;
        Sun, 28 Sep 2025 23:50:33 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:32 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 02/15] staging: rtl8723bs: remove unnecessary space after type cast
Date: Mon, 29 Sep 2025 06:49:47 +0000
Message-Id: <20250929065000.1010848-3-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary space between the cast and the variable
in two instances of type casting. Improve code consistency
and align with the Linux kernel coding style guidelines.

No functional changes made.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 516e736d03f1..43244e950faa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1101,7 +1101,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
 									(cur_network->network.ie_length));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8)cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -2547,7 +2547,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
-			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
+			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);
 		}
 	}
 }
-- 
2.39.5

