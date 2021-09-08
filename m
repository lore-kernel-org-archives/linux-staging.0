Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E772
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 22:39:26 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v10so5530331wrd.4
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0e52hbkT374Hg6sqdmTeXsKZzO23MHbscpUtA4GZs4=;
        b=kHZm2ZnIp9KBzrU9oeWLhawZ84TTxg6KLyJ1ZzzJVOLlWaEWzyIf6k5m7MJAhRs6ib
         DkUkkE1qZFM/hOFO7knzDUUW5HBIcfzHu3c24jSmvSMnbpYHv5GbH3b4ompY3TQK2ip6
         4XLvtjz84qqSZprJrE+HyPmnYviMMwr0sPua2w256hXzPWQYuadMYUBE7uftB2CWknEp
         zQlgHX+41DbVE1b9z+mWrZpfAZKDPvMAwsZDC9kWBDJSRBu5vrzYY7kwzjX0Dqayh9Vi
         SaK+0+0ieQoUO9beXF+WGnvu/r3p5QVAXwL12B1KO0YvlheEL4pPi0JhgzLVi36DCyMh
         FhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0e52hbkT374Hg6sqdmTeXsKZzO23MHbscpUtA4GZs4=;
        b=KMWc1YREXqPJOtiTE8if8f9F465OT3YB7kzr3tKAElZHzjR3IOgbyup3G0osiZ0IiU
         NfupDWoQbN2X/8b6lGITd4CNeYnZGaksO9XnLgxvwRe9BA5X/OdFjcyOhNbItCFWRfBD
         oxsh4XitA6+8wHCl009+3FG7aajb8WBCP7JgBNEoAUCBcYT0pNBDfaav0jYugtRgocu1
         epg0DXKs7n1lSscLNF52XiASJHv7XEpejKi7E6rAYk/Tl5v7Hgvo0OcGcElKyKwduYzH
         vVcq07ZqRsy3NpR0s2V+8D99EUrbLx88HOHtCeARM3C8vI7BJvhljLtCE7Fl9fD9yZ3k
         2uqA==
X-Gm-Message-State: AOAM531VP8VwiXRUxxo1t7QVAAVyRB+Ba1RkuA/QE3CvVVpOU/nGZIjk
	rzIkC4cvnrFNeZkof8QD1Q0=
X-Google-Smtp-Source: ABdhPJxRIZbXu0+CJ+dDUt1wyr3InT5QBvarlyrzRGlSgR1hrMikCX5TMGCbSsahOhsqW/ENDX6yYA==
X-Received: by 2002:a05:6000:160f:: with SMTP id u15mr608176wrb.166.1631140765034;
        Wed, 08 Sep 2021 15:39:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id d29sm428643wrc.6.2021.09.08.15.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 15:39:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: remove unused functions from hal/rtl8188e_phycfg.c
Date: Thu,  9 Sep 2021 00:38:59 +0200
Message-Id: <20210908223903.10516-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused functions from the file
hal/rtl8188e_phycfg.c.

Michael Straube (4):
  staging: r8188eu: remove unused PHY_GetTxPowerLevel8188E()
  staging: r8188eu: remove unused PHY_ScanOperationBackup8188E()
  staging: r8188eu: remove unused PHY_UpdateTxPowerDbm8188E()
  staging: r8188eu: remove unused rtl8192c_PHY_GetHWRegOriginalValue()

 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 185 ------------------
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  |   7 -
 2 files changed, 192 deletions(-)

-- 
2.33.0

