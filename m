Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7C1392
	for <linux-staging@lists.linux.dev>; Sun, 14 Aug 2022 17:44:09 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id o184so6557191oif.13
        for <linux-staging@lists.linux.dev>; Sun, 14 Aug 2022 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc;
        bh=MgVIXnrzamGi1CDQWdojbS7ElaBT1I5kwnpNyLD1mjk=;
        b=IvWKNwADAH+C6wMh9Gyr3A56r/geDdikybNfApEEZUCKFUWBOPS0LlYfZx2FTwUIZq
         91ELAo/g6Qu9rmC9lws9pZwccmo+lBuCWb1zwMi/QJUh+KukgvQHaOqZGMHMJwGSkmz+
         /v6iaamRFJxslyOw9uvqLS04YOceQtK+eA3gCAsR9SCnJ+lczpVb0DlElt+GZHNA/L8w
         t1rcazCJkMea0s5pZkeJgjtZJ9dwseetgxNIe27o2Hae6lFdAFOqBxGvNAz+TnSrZ3TW
         3N3ZAbcVY5RUt5zBzpS1W873Bm7R2cURyB+30BYIu/QRJngiwciLWq9ef482vIu8sVW+
         hseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc;
        bh=MgVIXnrzamGi1CDQWdojbS7ElaBT1I5kwnpNyLD1mjk=;
        b=ZpjWily4HCvzAYFDrgkwMYnzHQjsFmx79qO/5vayhkOLueVePiao9qlV6HgjcRl38p
         ZnU4C+CLo4ggBHGJ1GJ+O/csTQ6HkZBu6kgLM3JcGFicgdr2LJUqEoTV59GwIwzjqOnL
         IuoYftJAGsg/hi4XGZup74aBofXhvS60CxysXaV8Kyjgg6EGvfVmw+sMpDsz3/vpBJHP
         p2UCZc2KEOXNr7lUQmsq9B9ncF4vBrpstco506jGZKTVzm4/5z8AKh/2lLFzgJr7NhmB
         f/9iAxz0xShAq3eo+IraHozeRwapr8gkXKqJ6uNJLf6QIap8JC/s3xezvOedTmOFBBbK
         fu5A==
X-Gm-Message-State: ACgBeo2Y1WgOeOMfrhYLinot8sJ+dXunlaYWMosKyXQpp0NmJtr+L7Eg
	HMH+MwNst02+YJpS8cAtLkQ=
X-Google-Smtp-Source: AA6agR5jp0xp8Meg2NdVpgLJezQotEmGKedXqcXOXpzOgAfaKtGuK29QDcKqKL5ZWNTAUCHc/15lJg==
X-Received: by 2002:a05:6808:f13:b0:344:81ce:7f7b with SMTP id m19-20020a0568080f1300b0034481ce7f7bmr2681432oiw.248.1660499048910;
        Sun, 14 Aug 2022 10:44:08 -0700 (PDT)
Received: from localhost.localdomain ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id v37-20020a056830092500b00636a8dafdc9sm1654484ott.2.2022.08.14.10.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 10:44:08 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH] staging: r8188eu: Prevent infinite loop
Date: Sun, 14 Aug 2022 12:44:04 -0500
Message-Id: <20220814174404.25923-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index bc8543ea2e66..0a5f08427385 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -531,6 +531,7 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 	uint cnt;
 	u8 *wpsie_ptr = NULL;
 	u8 eid, wps_oui[4] = {0x0, 0x50, 0xf2, 0x04};
+	int loop_max = 0;
 
 	if (wps_ielen)
 		*wps_ielen = 0;
@@ -557,6 +558,8 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 			break;
 		}
 		cnt += in_ie[cnt + 1] + 2; /* goto next */
+		if (++loop > 1000)
+			return NULL;
 	}
 	return wpsie_ptr;
 }
-- 
2.37.1

