Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3F97468;
	Mon, 27 Mar 2023 20:18:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t4so4805587wra.7;
        Mon, 27 Mar 2023 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679948336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aE3c1+YhOpnk0+VqylK2i+T0h1qRBhBBnQ1pB7UIS9k=;
        b=pvpwGINoN7998DOLexrD/+Pee8XDqStCqWkT78+tvmaQ/q27xkiAGP8onBoufpE21N
         UL6N+PoxzlaIudePqUMCN6Kai2+CQ4uVp7JsPGNE3UvXYPs9xQt7ES6zJv+moleEotWn
         4vIrncoNr6dLY3Sel9hKOyR17ajZ9iRAThkQq0AmQyQWUv/ai9AGu0R01IyGdC1H9A0q
         BZYYrwZVLXdGkB0HYRHReo8zIXima+fwnCOa94LrliclLGwadiSknL3hSY00ZTaHzhop
         gby3aQmiTxNrGRUlLt/R+Hw+7QkAyFA+aKavuQN6eqoweow9w/QDRvmzhOGO+YXJ79/O
         ntUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679948336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aE3c1+YhOpnk0+VqylK2i+T0h1qRBhBBnQ1pB7UIS9k=;
        b=Wdh6AY0sn+CxtEXsiQoZLUVDOM7ggAeiT/CK8kqcEB58lDcDpN1aMU10K7lhY0/HxW
         JvtC1jq+TR8LDXWBOJ7NaqLpE+OZKHFsGGPBj8syG6HjjDgb8mQ6IjyiwKJUGEstTr8T
         EtUyJar5lDoVjbwzxpAoOGfCuq8hyLn7ud83F1jgtHPXvQ7pF1Vwl2lNXfvmc+3m/YPt
         SoFsUiVD8JXv7ELR44GLGWdUKNibxoAfcRnX3lqL05z4AX4CKv8rAiDhCD3ZWbKL2M+j
         6yz+eeFbQSr2BxK0H3QW7R2zj7TzG2NNePBJTzObgW15rGG7ho1GxcBp867fGz0awk28
         UbFQ==
X-Gm-Message-State: AAQBX9c+Bnqwg6g2G6A42eR6USHru10mhR91zpuWbJmo11pgL8nlSsUc
	yEFeYaCXAy+0cCyphMUCi5c=
X-Google-Smtp-Source: AKy350bWRrrFK/UWbIJj+A6sdJi9RcyEXWj3uELwAgv0zHzNsL0/kY6uaIKblmDOEyU/cEgGyveztA==
X-Received: by 2002:adf:cf12:0:b0:2d7:4c98:78fe with SMTP id o18-20020adfcf12000000b002d74c9878femr9996122wrj.34.1679948336309;
        Mon, 27 Mar 2023 13:18:56 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d6b0d000000b002daf0b52598sm12725301wrw.18.2023.03.27.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 13:18:55 -0700 (PDT)
Date: Tue, 28 Mar 2023 01:18:53 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: refactor arche_platform_wd_irq() function
Message-ID: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Refactor function by adding goto statement. This reduces the
indentation and fixes the issue reported by checkpatch.pl script.

"CHECK: line length of 101 exceeds 100 columns"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..c7d3b6f7368f 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -178,11 +178,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 */
 				if (arche_pdata->wake_detect_state !=
 						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
-					return IRQ_WAKE_THREAD;
+					goto out;
 				}
 			}
 		}
@@ -205,6 +201,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 
 	return IRQ_HANDLED;
+
+out:
+	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
+	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
+	return IRQ_WAKE_THREAD;
 }
 
 /*
-- 
2.34.1

