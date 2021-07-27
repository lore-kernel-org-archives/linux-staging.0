Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700792FAF
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 21:17:00 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso1133068pjo.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+X6IZihoLyfy0Wiif0jTU6fGkcegk1/ptK7zaE9ExOM=;
        b=C4eYS/6TxLrtnqsan6/J7Zca8RC2bv+OkK1KmEC0TiMGMWF147lSswQVfXydxoonCd
         zUdwx1Va4ndolescW59fUk3TLT83BFmUXVeMdetdNsqEz8mVXPv0ewYiE5zskXAgGk4G
         Q7ZCHD74HyxqBUrj3K+I9j5R8mEVX54Z8kNjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+X6IZihoLyfy0Wiif0jTU6fGkcegk1/ptK7zaE9ExOM=;
        b=VBN9x/Lkc+IFUndZiquJnrosP2BAn8rw7AF6epnzw/pFSQ1AKWVpEBUtMTf+P9POYn
         /+JX2vZjBlpP7759BtRDnrPe1kkwv/2WmVE2VUdu6Jj3RfjQPu+2PkLbIlWJf3+VndCS
         bd6zjf84QpaLDRRoMzgyErScY6vPV/7p2H5VQzAWyiT8eirureSShDs7eSlNKRFdilek
         qbuuIZ7/GS0AjgyIev2Gy9Nd3h3L/HeTFYVp/6C76cf9E0B0opD1uu6g3uvTdazPwPcp
         oL7W4n8cq0lVLzpM+9oMdITmzxS5QgUraI5+TJMzxhkmDKAUbTirAXmsUwwtl1nFk8cq
         nxjQ==
X-Gm-Message-State: AOAM530mMCkjMIOnA+paLBfmDR1tIDKoIE4z60AyarBnfQ5VsaXiB++9
	j0ZXKr9RhMm21BGLt947jfCTZQ==
X-Google-Smtp-Source: ABdhPJyZAfGbEamLyC4c8LmiX8ynap4BNwnOsYzL7JJhP9bqJWc1REFfqqEuGbkWyeEogyJh4AGqqw==
X-Received: by 2002:a62:804b:0:b029:328:db41:1f47 with SMTP id j72-20020a62804b0000b0290328db411f47mr25007825pfd.43.1627420620114;
        Tue, 27 Jul 2021 14:17:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z124sm5174411pgb.6.2021.07.27.14.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:16:58 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH 52/64] dm integrity: Use struct_group() to zero struct journal_sector
Date: Tue, 27 Jul 2021 13:58:43 -0700
Message-Id: <20210727205855.411487-53-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; h=from:subject; bh=06AwgDhDm5rfSJczNzpy0ALLnPqFifOqpq/XiymXeZw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOLkvi4WP3nwdDAQoa1QSWSWWQpEaKPsLt1Yrm3 8FcNJeSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziwAKCRCJcvTf3G3AJtOGD/ 4oB/qnnjc336AyH1K6CiqoIGRiODxOG/34zhnJ2L3+mEclURUs4GXvEBs+ynT4uxsaY9QUrjZhpqCp cdyjZJptJPu5bTduPuT/zB8wtiA1nclT/0pnTgoVaFym7lXLnek6LJsOD0RkPwz3jefg96VcdXLn6T TubbzJ4g0ejSYk50gFY2qrA/M/tOBn/OnNwc05C5P9FMHi9s6oV0SFXBMrqdxQCBjmbWQ6Efr9RdXD anks+/yMI/Ww+Lmq1IKQ+10f86r0m2ii3mT6s7tkBApimQWsrgRRguCOY8Ik4wqIaIQQ8IskbwjfRQ zAvsH8PTdNbFjoqR3LIZWIALOtNDkrAIG3wYkJUVq8qBNCH0Gbs5b+3ICmwcEGk1rjYJtGD1JttHO1 8dhqMnihZZQgW2QTqO9UALTRvnmppmvMGXI9t1RSj32G71bLR37OvLf8RYbb5U/ZwW1mG1NdfR18IT +53ZFRG56YQXa/CvxD25rnfVEjsakHncwqKoh+QE/qcQ0lrgJ4wN1lAf0tGqQ4EFaPskxJVADlbjmN 32hM7hI6LNVfSBDdz70anPmudlxiL2l4IWNCgn2CQFA4uwHDgkkIs+OhSEEXPGp8z4obbVQoaGhoG3 canI+R37hvHDQXuDDJFTaj6vFfN8KFalRxYZp56Y89KxykB44tLc2SwCNSPQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark region of struct journal_sector that should be
initialized to zero.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/md/dm-integrity.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 40f8116c8e44..59deea0dd305 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -119,8 +119,10 @@ struct journal_entry {
 #define JOURNAL_MAC_SIZE		(JOURNAL_MAC_PER_SECTOR * JOURNAL_BLOCK_SECTORS)
 
 struct journal_sector {
-	__u8 entries[JOURNAL_SECTOR_DATA - JOURNAL_MAC_PER_SECTOR];
-	__u8 mac[JOURNAL_MAC_PER_SECTOR];
+	struct_group(sectors,
+		__u8 entries[JOURNAL_SECTOR_DATA - JOURNAL_MAC_PER_SECTOR];
+		__u8 mac[JOURNAL_MAC_PER_SECTOR];
+	);
 	commit_id_t commit_id;
 };
 
@@ -2856,7 +2858,8 @@ static void init_journal(struct dm_integrity_c *ic, unsigned start_section,
 		wraparound_section(ic, &i);
 		for (j = 0; j < ic->journal_section_sectors; j++) {
 			struct journal_sector *js = access_journal(ic, i, j);
-			memset(&js->entries, 0, JOURNAL_SECTOR_DATA);
+			BUILD_BUG_ON(sizeof(js->sectors) != JOURNAL_SECTOR_DATA);
+			memset(&js->sectors, 0, sizeof(js->sectors));
 			js->commit_id = dm_integrity_commit_id(ic, i, j, commit_seq);
 		}
 		for (j = 0; j < ic->journal_section_entries; j++) {
-- 
2.30.2

