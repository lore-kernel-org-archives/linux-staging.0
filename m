Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331201380;
	Mon, 20 Mar 2023 08:26:31 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id o12so43350634edb.9;
        Mon, 20 Mar 2023 01:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679300789;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MLz3hRBfX2H9kEvnXukqy9ngVwHdXnfaWeWONnLje10=;
        b=VwD/cTCpK2eod5z/7muOl6+J7Tq9jX8bgEJzMWuM6UWdUmscthpSF17CqC/LzichUE
         SnhGfHT3d9QJyGIwg6NbGJREF+XzogXguXf3m4V43gTbbQktn8vI7sfgR0TG0wVa0wHj
         8n1mI24Uwvcrq2flFXFJVIWpz6D7BM6UMlpgi8JyzIeDYq3CkpO5SsPCtqB9NiVmx0v9
         BnznADdg7QWsC9s5wJLQAeJ3wFST5xoFhEfxr9scPqIje/qO5mjWKT9SHp3zO1GAxVkh
         lhphJpVsfuTfdvSxHNiAu7Y6xtYuza+RgWWMmdvMLn/a4C1Qn0jKnBcRl5XpkLNp5UQy
         uzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679300789;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLz3hRBfX2H9kEvnXukqy9ngVwHdXnfaWeWONnLje10=;
        b=jONlRoVWyCjJdOcDpCF626Q1kQgntN0WlSJo38GJhMS5SyyIJUutIVeC1XJ1DXk/rc
         XD0HBiZIqHOrnGlV+LjVuhxcWxQWGs3T1+XeQZA2UoHYYNp6Jxa9WI6s+D3+bNs0YBIs
         5mKO/Gcz6A83HEQ9p1tUY+3DZ6oJa5EXCJpFFsyC2znKMNuEE1TRnvefEucAQMKiYpa7
         yEIZEyuLQL6CoyOlQIEFx2AhJ+8tE6y3znySDq80pNASTm7pD/MjHXyA2PTHvNWzKYic
         jkPKdQEzm2pQFMgqLe6i3POMiFtay4I9C+RA0SVqhoaczPbJB9ErRPmcIDLp5ov8oqV5
         83Yg==
X-Gm-Message-State: AO0yUKWRQaDfdf11AV+BKJrD7fBnyKcNeNuAVlcGfUeFI9a8rRa0XPGb
	hyYLFulXdzGFmbSpal9Ztdk=
X-Google-Smtp-Source: AK7set8d9sgILfZHW+akuoOmIEj/S+YtcQwxysXg+R+z+yF04NSZlFIinm9t2bQRA4dZlz+2IKBR3A==
X-Received: by 2002:a17:906:3c4b:b0:886:7e24:82eb with SMTP id i11-20020a1709063c4b00b008867e2482ebmr7155552ejg.21.1679300789202;
        Mon, 20 Mar 2023 01:26:29 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id hf8-20020a1709072c4800b0092b65c54379sm4100679ejc.104.2023.03.20.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 01:26:28 -0700 (PDT)
Date: Mon, 20 Mar 2023 13:26:26 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: greybus: merge split lines
Message-ID: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If condition and spin_unlock_...() call is split into two lines, merge
them to form a single line.

Suggested-by: Deepak R Varma drv@mailo.com
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---

Changes in v3:
 - Removing tab to fix line length results in a new checkpatch warning,
   so let the fix length be as it is.
Changes in v2:
 - Rephrased he subject and description
 - Merged if_condition() and spin_unlock...() into one line
 - Link to patch:
 https://lore.kernel.org/outreachy/ZAusnKYVTGvO5zoi@khadija-virtual-machine/

Link to first patch:
https://lore.kernel.org/outreachy/ZAtkW6g6DwPg%2FpDp@khadija-virtual-machine/

 drivers/staging/greybus/arche-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..6890710afdfc 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -176,12 +176,10 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 * Check we are not in middle of irq thread
 				 * already
 				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
+				if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
 									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
+					spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 					return IRQ_WAKE_THREAD;
 				}
 			}
--
2.34.1

