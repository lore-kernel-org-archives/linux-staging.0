Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D1A2C82
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 15:32:24 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id m15so23999202pgu.11
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 07:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KrT+feO4jnWB4qX0RGpa/8Soov2WZ3IzNfAVkfbdgTI=;
        b=ma7EZbMwQXE247j/JhwHgzIWPyKJ5oPomd1r/MLnckKAUijBHl1U47v3UuecutrHMt
         W0nwyvF/bJ6a4EFgA5UPV46nwRCdpjGp9tGL6AxZ7ZkxyqRzu57/Aye0GpbR1LfzUr1S
         HHQr8ztVmTDrmA1fzNl//7Wc0YUDgKYU8kwKqN3H2Aj7DqqupLcUXCAH2ijFQ8FzRsmE
         ERSy7WA43Y+FjEVWvA7IuuWtY+mSE7MoXmZnPB9SL4+dYvvli0WWzBkwUWLNfmoVyKiR
         nyHuae0zz+fEGjvM7pqdM3zHSMSfltjq9i42beCRbfP+BFaPM+OZEd5J1kCgutpy0LS/
         znSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KrT+feO4jnWB4qX0RGpa/8Soov2WZ3IzNfAVkfbdgTI=;
        b=E865lPoSryjnGMl0anmupOMKVg/Y8KBp9Q9fHI370Q1oL3oeCMqKTWYs7uAzlGTp7W
         qYVGJu3m+m7chlCKNbN3RONUoD4WSsbrrPZmS+glGZf3QGp7B4oJaQh7xnx84gE2Fl3I
         WTVugMRMbk38ieUb0OC8MT+vKjmC1MMcR4H2eZqg5GafcItwAoL0j2Nw4gwLY2+7eaEd
         THOmXwTozAdWZaeRSXtzOYwanJoKQeFyW47albqidY69hSYlzcH/xLkbOw8jw2qjj7O4
         oXpeJt3aE2Kjja0uvRLA9rJW85RZ4vR5KBsQIM/CefeBGkRxtvPGlAau8hX8eFkXZM7a
         h64Q==
X-Gm-Message-State: AOAM530uduBbMjlbptDlPvQSTZmHOz+NbKrXNpWr0E2ppPLCw9erDJ23
	8+ptYNfBynVBSkvuH4HIk/s=
X-Google-Smtp-Source: ABdhPJw8c9dtJdcGzrZVMkPW265/TG0sEQX8PPXRYeFZXXK7s3uwXJjnPIV+4kEqAzn6KFTBpRQnUA==
X-Received: by 2002:a62:7a54:0:b0:494:6e78:994b with SMTP id v81-20020a627a54000000b004946e78994bmr6745750pfc.5.1638372744031;
        Wed, 01 Dec 2021 07:32:24 -0800 (PST)
Received: from nlap2.localdomain ([106.198.84.234])
        by smtp.googlemail.com with ESMTPSA id 7sm91772pgk.55.2021.12.01.07.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 07:32:23 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH] staging: r8188eu: Fix coding style error
Date: Wed,  1 Dec 2021 21:00:39 +0530
Message-Id: <20211201153039.305245-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move opening brace to next line to conform to kernel coding style.

Fixes the following checkpatch error:
ERROR: open brace '{' following function definitions go on the next line

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b4820ad2cee7..627ecd45beca 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -252,7 +252,8 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 
 static int has_channel(struct rt_channel_info *channel_set,
 					   u8 chanset_size,
-					   u8 chan) {
+					   u8 chan)
+{
 	int i;
 
 	for (i = 0; i < chanset_size; i++) {
@@ -264,7 +265,8 @@ static int has_channel(struct rt_channel_info *channel_set,
 
 static void init_channel_list(struct adapter *padapter, struct rt_channel_info *channel_set,
 							  u8 chanset_size,
-							  struct p2p_channels *channel_list) {
+							  struct p2p_channels *channel_list)
+{
 	struct p2p_oper_class_map op_class[] = {
 		{ IEEE80211G,  81,   1,  13,  1, BW20 },
 		{ IEEE80211G,  82,  14,  14,  1, BW20 },
-- 
2.33.1

