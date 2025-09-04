Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781DD1E3DFE
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952110; cv=none; b=so/vvHuEwJ9f1WdAAqa3jzkV5Axo6yaGohjsDQf9vPrXEUYoCzw2qYC9ESnx93YrSxy/Z7Nfb2CfLEoESV4uFDjQ0iY5r0HKkhVOfY2r2bATcDMcJGBSg3xOxq0djCtlAUV+DiAV5CB+/Mb/0XBS8sOEzik4e5R4E29TZBZdUb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952110; c=relaxed/simple;
	bh=JmI3rvfGEf1Z1riF8sZuENvE+ZlBl4htm6xrdJ3xaEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=buVmq/UrrEV1DpMwNtunpFpH385d9upPH6GtQWTvKDrgiPIe+4V+AAK33lY9tgS35f5VcZY6Od6L+x1X2vdbwaACsuiplnCClQVzUBNGFRp/MLYXG+dAl8qDKPR7o0WvJ0RqqkIh54rcgoljTjnptwog2hqDDB/IP1Xr40S4Nzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibe0nvYc; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibe0nvYc"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-807e414bf03so79414885a.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952107; x=1757556907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=420xhJpXeiS8O0VHfKZK4Z2TaOUNPYgxom/AXLmk2uA=;
        b=Ibe0nvYc4izjqRqBp9qCMi5F6TzJzoNRvzWSYK05Q0NWd2P4HHzwO64Hzi1zz2zioE
         or2JXfybFJkkI6b6bEJuNpaKHpTwVFAJahskBJMMUwDpW+f0f5hW1U2zzq9C3CAios9H
         9Ma8QyoMi4I9uQ6p7TjWoHdkYHIBzHnPWoARhx8nzvn8IXM3dfhRzfJQ9WxxMsOzJxOp
         X6cyPsqIz5YZ8q5DhLatqxVP5Ki/sxpycsnFgiew/MogGFVvPG7EOheVhYW94rdvVZy+
         zfJXFlIIkvenlWpwQSzSxc0MNNYSzL0/64NENOnJUGZP+e/qItIfjA+fRUf0krpY1KTL
         0N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952107; x=1757556907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=420xhJpXeiS8O0VHfKZK4Z2TaOUNPYgxom/AXLmk2uA=;
        b=A2JFRPzGSfIl/DW4AF/wLNRP+lDjPQc6SfZwh+QZi1XnESxe3izfNwWe0VAoEW9eDc
         PuH1Azehj4E4cnihZSrgpWjBk1RkN9tU0WhiGxIbygxKqYORbUONSitpKdKwQzDovcQJ
         am5cXQRLZZb/iHywhIDMTDpGCGDq2hQH2J2hajyikOiArSGiFuaohcHU5IXtJ89umYOq
         HMJaKTfMFVcYLm7m7ElN82EYAVTdOIUIqezXRVlV3kMw24Rk7rbAYKKAAFbnkiYSi+ZW
         xU7gbR5GTF0agH5xebxQjACSDnniZhdy5gIZFdPj8CwRyF/wBLsVumyW/sZsc5qmDCnN
         w8Kw==
X-Gm-Message-State: AOJu0YweEW5pxf1kDwpYVJ+5Tv9NX7/lJLlNa/hW0cXhjagqT7TeK0ho
	Q6vof8fpwFpzEz+EuxU5OZc9vkP/Lsilun1wEdDwyGlBfx7aJ4C7Y9kq
X-Gm-Gg: ASbGncvEeQ+OAzhJpo6/EpSyDJmQEiqlVga3Ddk1o34p+FT8WXDKVjejjLdrrKJ/kkh
	BDdeime0kvkg0rRADPktdXITzoFNGMhSKEG3LszgrXxL9aUJvrcG1qnwVybETUsulJSvVo3aUAl
	I+7LtOAkZHtgCGJgqQWdpamQzttHRriLY2ozWdOLCv2RV0egjXg8i0mpRmgyZo8wnRjrAiSkEFW
	is0J5JsJEPECGUZKelvoC2KG/r5dqSKa9aZ9V7b6GFhxjuYN9Iiy8DKiDNczgA8jPis2PkaeJ34
	ChFVcno8+IS0YnH+GnSAM6D+uTRyHUwdwQERXfZSR0PyUL8V2s3XhgCT8OvMRwlHE5t/Dk6qgF2
	H+m2vNBij516ROV5KEEqd31urg1+bIauMvyJ4bdlWdY3QdVCJDMDep3qRUom/TQ==
X-Google-Smtp-Source: AGHT+IG5kLD8eWxZPLfL+wNBvxFGXbMhdVZiaoqWw8aRLtKUk8BnB3R9Wm0KBkGDhvNrtgPFa70+1Q==
X-Received: by 2002:a05:620a:40d5:b0:803:d9eb:5663 with SMTP id af79cd13be357-803d9eb5741mr1386993585a.34.1756952106984;
        Wed, 03 Sep 2025 19:15:06 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:06 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 02/16] staging: rtl8723bs: remove unnecessary space after type cast
Date: Thu,  4 Sep 2025 02:14:34 +0000
Message-Id: <20250904021448.216461-3-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
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

