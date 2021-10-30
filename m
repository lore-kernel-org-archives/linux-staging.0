Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945F72
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 11:04:58 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ee16so34374690edb.10
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=kW8R9SA1PO24GWmM8va5/S4cdD8fXl54rhmf6VGOvqM=;
        b=FQvrt73CL5OdhsQ2sojiNBE5Fw+U9ktEFhg7UCN+f6llp/0kvkWnn7iA1/ewOBbPnh
         Rin7hfxBKUMI14FX86VqHiQgEAzbxG+fTBlBoil5/iNF6TSrE8DU9b84dV/f3uFJ3g+2
         tZaan8q0zQC11tcYos9dBdftgDU61TlWDXfckJX0xb8hHuahwkjAUVgYJw4cz8knZWAc
         OAPb+Btr8bWtk+Ml4fXqvzLp1Ijg6F0a7SwLYzt4dLtqEaTCFvHEueGiUeO0GF5lv0mf
         M4XLvlmcnFv7T+/lvSCbGzlXVnhhxgNnGrJXwIp2AcF53ko9fVjscZnlo8ySibhPql1e
         18BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=kW8R9SA1PO24GWmM8va5/S4cdD8fXl54rhmf6VGOvqM=;
        b=hUSyvE2B6btf+VGnwxCMLe6yhN/+z1HgS56pWOzz9PgC+Kak7yrWHkAdnv11IYgwaL
         W/D4Ht3yEMflOkAztm9Cq7UjyRY7CBLD0ahSeQ5rhGpsLzmvEmDbYU+N3IOqxw8umZ3a
         QpKZ8Ug93DrmJZGF+uuNMjGHgA9av9djIQ4DuSSDvKn7Ot/6LTiDXFIx1pSTmTn9Mk6M
         pXl4x+hTqCyeK6V4IB8ghfyNF1MRLAoMr0861GNwulLMb8ijEu3lqBvqdyp7T/PGTbY9
         pXBTgxd8H2Umjihz4DQE016KNf8SrBKYH6qDbMW+9kWj5ugTW5djq6+7qarR3ZKmuMhb
         LK3A==
X-Gm-Message-State: AOAM530Aee0CFbn3MdtJzaiKSTpbjjVcXV7xf1oVThpUnqsFWxDfJgfb
	pNIC1wlveR3oMYAzxGXAesCzHwerVOBSg5Zl
X-Google-Smtp-Source: ABdhPJxByPUHP/cya+TpZOszzHbwuwqFNXDntREEiWgHOfRMuaZDuGTcr+exz5mqAVigzkzyIxTAnA==
X-Received: by 2002:a17:907:3f25:: with SMTP id hq37mr20832146ejc.155.1635591896228;
        Sat, 30 Oct 2021 04:04:56 -0700 (PDT)
Received: from desktop (mob-5-90-201-67.net.vodafone.it. [5.90.201.67])
        by smtp.gmail.com with ESMTPSA id o12sm5171173edw.84.2021.10.30.04.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:04:55 -0700 (PDT)
Date: Sat, 30 Oct 2021 13:04:54 +0200
From: Gabriel Goller <gabrielgoller123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: wlan-ng: Removed unused comments
Message-ID: <YX0m1jF6p6OjMTRV@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed commented-out code pieces that are not used anymore.

Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
---
 drivers/staging/wlan-ng/prism2mib.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
index c04fc17b3c64..fcf8313870af 100644
--- a/drivers/staging/wlan-ng/prism2mib.c
+++ b/drivers/staging/wlan-ng/prism2mib.c
@@ -679,16 +679,8 @@ static int prism2mib_priv(struct mibrec *mib,
 					       HFA384x_RID_CNFWPADATA,
 					       (u8 *)&wpa,
 					       sizeof(wpa));
-			/*
-			 * pstr->len = le16_to_cpu(wpa.datalen);
-			 * memcpy(pstr->data, wpa.data, pstr->len);
-			 */
 			pstr->len = 0;
 		} else {
-			/*
-			 * wpa.datalen = cpu_to_le16(pstr->len);
-			 * memcpy(wpa.data, pstr->data, pstr->len);
-			 */
 			wpa.datalen = 0;
 
 			hfa384x_drvr_setconfig(hw,
-- 
2.30.2

