Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF5D12B70
	for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 13:21:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6667B1FD6D;
	Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693228896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7Lw+QhQ4Al8+1I8ENOsw8wL0K5X8107kywRgj14vEI=;
	b=OTgIpYJ4OV6W1joLQhKuxJmBgxSv98ly1fK/pGxhNJpoLd2XHu2VsPfpnxVfU70NmZ41v/
	Wks20C/wJ9uwjBakWfuM/8/eGD7FEju5FXzw1odNPHLwWvmx6aLxKdmNwmziVvrkVMkiLV
	EWgWhkbPbTzjt5pYLVnZfbsJf3ukkAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693228896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7Lw+QhQ4Al8+1I8ENOsw8wL0K5X8107kywRgj14vEI=;
	b=bxRXfEO1QsEEQHqAfr5ySvBc4rP+ed04NLhtZUXYn3fGVSbvgvn3WUVurKR4RIuKWm//IO
	cdwNDKwl0/ppbADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2076413A11;
	Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EBkCB2Cf7GTyOAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 13:21:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 5/8] hid: Remove trailing whitespace
Date: Mon, 28 Aug 2023 15:14:21 +0200
Message-ID: <20230828132131.29295-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828132131.29295-1-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style in Kconfig. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e11c1c803676..b50054a41c10 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1037,7 +1037,7 @@ config HID_SONY
 	  * Guitar Hero PS3 and PC guitar dongles
 
 config SONY_FF
-	bool "Sony PS2/3/4 accessories force feedback support" 
+	bool "Sony PS2/3/4 accessories force feedback support"
 	depends on HID_SONY
 	select INPUT_FF_MEMLESS
 	help
-- 
2.41.0

