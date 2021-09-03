Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C99172
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 09:34:13 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b10so7357709wru.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 02:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oznwyLooQ2rhxtSqFdj86ZRnOv4fBG2J3jHuHaF1yHE=;
        b=JoXcaDwhgnMRJEWj2g2has1eZ0yY4ltbJg6pxCKsVVuBwKcNCUGfosjNn2WWMsauY0
         Nu4ihue8A4cZI6pLYwsOuspwKJUQNp9+JXWzUbRW4X9Olrpy618jNbm0v2rPhQgDIZg0
         1S/fmKjnY2bhgJB8twzpX7aMZGsE6F6qQknJMs64KMRo5hwd+nVpXG/1mGuw63Qx8t3V
         c0GB7H81OfZPdegjsLn/X3o5cPN3QhPsNtNxqOqT+MyS981VRPe8mRkn1SCwRqhJSGGc
         TUolZvdXmV8KUbehSPsFJ4jt4a5ItvPMoa1q0p1J1WqGt+CJzmwvSnrdfsPXn0z5EF7B
         7JIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oznwyLooQ2rhxtSqFdj86ZRnOv4fBG2J3jHuHaF1yHE=;
        b=OxnuWH/zNu6QUhv/O7qy4delr/LuIFyd2h5dU9loeFGxIlEe6lJl52tQkqiAXulhiG
         qMvmyo0Y/gOc5ZpHCUdjHoZVbHdbjdni9U3dQ5Cd/yO3T2ZCZmO33leVeejDmA5aZ5w1
         MgOVklljNGKekZ2PhIkY04LBrn5GnlhJlno16o8UlFBsjQhnMs/wazkumSYYiM/JS2hV
         jFYNHxL7QyNHE0C9FgWlXwgYnT8umfgxedF2ktkPyv0nP/mbnjNodCYGutj2kZ3Bd+hR
         rmDm3eiZ6e4tzmjGgso9LLFG8wguXmJTeuDWzV8QW9e+D2XGuKQI1lQTcMEo++0Il49K
         mEAw==
X-Gm-Message-State: AOAM531ImUvDdrMDP9zektqB5uuz/apOFea/kZ5hSG8Nlb0ChOoJ3TTA
	tKouAD1drq8EcvEzZGJm0nzQ2rbMJdtv8A==
X-Google-Smtp-Source: ABdhPJx/+h8UZIFCxZiltfDZtgYQjnz6VeGEXE2xBJC2LwoUstv45cDQ6Ku0Mnsvv6luek7fadzOzg==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr2931481wrl.65.1630661651619;
        Fri, 03 Sep 2021 02:34:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm3853060wmk.21.2021.09.03.02.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 02:34:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/6] staging: r8188eu: remove unused enum rt_eeprom_type
Date: Fri,  3 Sep 2021 11:33:52 +0200
Message-Id: <20210903093354.12645-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903093354.12645-1-straube.linux@gmail.com>
References: <20210903093354.12645-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused enum rt_eeprom_type.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/hal_intf.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 954de3ab2613..bbdbbf9697b1 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -254,12 +254,6 @@ struct hal_ops {
 	c2h_id_filter c2h_id_filter_ccx;
 };
 
-enum rt_eeprom_type {
-	EEPROM_93C46,
-	EEPROM_93C56,
-	EEPROM_BOOT_EFUSE,
-};
-
 #define RF_CHANGE_BY_INIT	0
 #define RF_CHANGE_BY_IPS	BIT(28)
 #define RF_CHANGE_BY_PS		BIT(29)
-- 
2.33.0

