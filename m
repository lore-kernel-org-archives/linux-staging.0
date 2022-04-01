Received: from m228-62.mailgun.net (m228-62.mailgun.net [159.135.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4947FC
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 05:00:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1648789256; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Subject: Cc: To: To: From: From: Sender:
 Sender; bh=l+7Y194RkHEDvlBRUE9dOX8hqW2hHbFhgCzQfGAyZwQ=; b=cLzcO/if8UqiDrZIhsHOK4WLePROi1nwEZweCNG0wwtqQsKrEe2MjJdr6Zyv29VwijBeO0MB
 digfF3ZLpzOrcU3vUvPcYu1efyjzXfgNS4cWBY+dWN9OsE5A7hqD3x/DAwDl8FMK8w4qFesx
 bwieYGcpLIpKmcfTYjN+MJvDXq+wOODjOdxP3bgc8AxLmh0HMMnAGcBp+TlDg+/Aj3/Edw2E
 njN2lTfJOveN8zDWwwPbaRZpnqlyFzj1X3YA2cisX0m66D3bMsXf6qzbafLvaJHKkwgzZeRm
 61ScBJncmLGQgULxmIY6BSN+McjAjdasWTb4wLvtXJNwaS4CN04d1g==
X-Mailgun-Sending-Ip: 159.135.228.62
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from localhost.localdomain (dynamic-user.170.84.58.28.mhnet.com.br
 [170.84.58.28]) by smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 624687077afabd0707a01255 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 01 Apr 2022 05:00:55 GMT
Sender: codeagain@codeagain.dev
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: reg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Subject: [PATCH] staging: vme: Adjusted VME_USER in Kconfig
Date: Fri,  1 Apr 2022 02:00:45 -0300
Message-Id: <20220401050045.3686663-1-codeagain@codeagain.dev>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the VME_USER driver is in the staging tree Kconfig, unlike
other VME drivers already moved to the main portions of the kernel tree.
Its configuration is, however, nested into the VME_BUS config option,
which might be misleading.

Since the staging tree "[...] is used to hold stand-alone[1] drivers and
filesystem that are not ready to be merged into the main portion of the
Linux kernel tree [...]"[1], IMHO all staging drivers should appear
nested into the Main Menu -> Device Drivers -> Staging Drivers to make
sure the user don't pick it without being fully aware of its staging
status as it could be the case in Menu -> Device Drivers -> VME bridge
support (the current location).

With this change menuconfig users will clearly know this is not a driver
in the main portion of the kernel tree and decide whether to build it or
not with that clearly in mind.

This change goes into the same direction of commit 4b4cdf3979c3
("STAGING: Move staging drivers back to staging-specific menu")

[1] https://lkml.org/lkml/2009/3/18/314

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
 drivers/staging/Kconfig | 2 ++
 drivers/vme/Kconfig     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 932acb4e8cbc..0545850eb2ff 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -88,4 +88,6 @@ source "drivers/staging/qlge/Kconfig"
 
 source "drivers/staging/wfx/Kconfig"
 
+source "drivers/staging/vme/devices/Kconfig"
+
 endif # STAGING
diff --git a/drivers/vme/Kconfig b/drivers/vme/Kconfig
index 936392ca3c8c..c13dd9d2a604 100644
--- a/drivers/vme/Kconfig
+++ b/drivers/vme/Kconfig
@@ -15,6 +15,4 @@ source "drivers/vme/bridges/Kconfig"
 
 source "drivers/vme/boards/Kconfig"
 
-source "drivers/staging/vme/devices/Kconfig"
-
 endif # VME
-- 
2.35.1

