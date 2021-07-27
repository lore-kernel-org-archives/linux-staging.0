Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E352FAF
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 21:16:57 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id e14so41105plh.8
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=as474LhSy42cHKge7Gy2Fn1oqutkW78m6VkSl3HByJE=;
        b=lSOk/hBBmMlB1rYWTRaPXPIkKi/CxdsLOHI3vbEi2GSoFn58wsWtYlaoOfqvPj59dt
         ooaVxGQyHEHZnH0A70oChu8vvpJt9DQZz91T5V7lJ7/jvA+gX2vgTxoF4L8nNLo3A1bm
         hHNtGTPTcV/mXDEkppwsVuEpgI+3vO6Y1uBxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=as474LhSy42cHKge7Gy2Fn1oqutkW78m6VkSl3HByJE=;
        b=fK+buoLh1/3fpSLW07+AMItFV3wlR8RTJ0l2e0HiMR2IrC4QG133f/aG6gG+oein5u
         5eZSqU6/UbqWAz7Cuy20oWitGG2Nge7T/CQ2d8yWpa5Jbiis421BSqllEWFyPLfd+l+9
         nDM6sjGNherR9yhaXNZk8IMvM4g97oc/aZ5GZMHclYfdeGbRNs7OrEZx5y/OqvZbe3Db
         EspO+IKQEBbkh0drCnEbSh7bXGb3bejnTMR+0pOy4fuZid+G2HMJhz7oJ07uHFRykzVi
         R9CAGKFu123Dor6+YhZUdRiggM0BsjL7i2UGCpJrT6VQ3NbVq/5s02QydxVCDJOYLEZT
         7hAw==
X-Gm-Message-State: AOAM531B71zGcAZ6VXBvyIdXhEtwpsP1SR5bURU6cp4w9KvE3ZO04SzJ
	ACulBDLJNh0VycwcILi+os7MMA==
X-Google-Smtp-Source: ABdhPJxGaEK/7GM0+vAKulISQNQ8zNmBoY4IggEYKPysQEG+1vegv9sBaDZhhkPzUiJxyIhOdVgTMQ==
X-Received: by 2002:a17:90b:4a4d:: with SMTP id lb13mr6031654pjb.221.1627420617450;
        Tue, 27 Jul 2021 14:16:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q19sm5028194pgj.17.2021.07.27.14.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:16:54 -0700 (PDT)
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
Subject: [PATCH 46/64] IB/mthca: Use memset_after() for clearing mpt_entry
Date: Tue, 27 Jul 2021 13:58:37 -0700
Message-Id: <20210727205855.411487-47-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; h=from:subject; bh=EIIm+0VdwQ9IH2XMV6ts5pIWwaxyRwboIG5815tF7+o=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOKarr4bIPgvwWH2qKkwLe6/q8cDAlBzD3bLA24 ll85FGeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzigAKCRCJcvTf3G3AJvwwEA ChEYdVEvOlY6ZSSDwSK+GqTMcoJtHYXIXerlg3cv7Z5B/nj+4tsVkjpbbg6qYJ7G6Wn5LCRzlLTF/B JEQNK1K018MnLFUCnQdrWeHhqOML4Z+QY9330qvih8kbryLwUmmPm8tMDr8k7xeqODqXV0ysJUPb2N xVAh/ldKgMIWN0SIEK4b/AeC9lC2gYUHs0M9ufsvUwE/w7u4/dJRXGEtfOnpjbz9EiJRevDyOxG/L7 5kQTjyY65fkZSD9d3DQYA0of/YGF5vIAzSb90hB4BR+6elYWhMJodLf6s9scmQdVrWhXQ4dVg6J+8M ycSHtAUfvV0kejqMCcI904M9g4jJuniybmlBLuzSIsi21ELju85L/7B9KiYaqlPgChXogQSPXNk5Kd 54beIYuu1Fd49rYR1R8WtEoklJaIrmJSkYaEDaYgFR3e7sXiui1Lo6/7QEjLjklWuNupXgY7d+KgBw oCFrVzGvwPnUGDQnGEfR2OxN6HzTznt5SuyVEVOZkOSmgu5uS6ad9csIugS5srvBjmEQQuXMfiCcAe FRY7ypPn9oUPWMah/ykVuPdD7cmvKT/OghOEHP/qza9WeqolkQBPyj4t9m6qBq2lsFMVjj3xVeXXM2 +eC9JXnzHZx87wkFYpcVJstfzhif8T3qljrVvmM3fY2NknXhqRg98uBOWpsQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_after() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/infiniband/hw/mthca/mthca_mr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mthca/mthca_mr.c b/drivers/infiniband/hw/mthca/mthca_mr.c
index ce0e0867e488..64adba5c067d 100644
--- a/drivers/infiniband/hw/mthca/mthca_mr.c
+++ b/drivers/infiniband/hw/mthca/mthca_mr.c
@@ -469,8 +469,7 @@ int mthca_mr_alloc(struct mthca_dev *dev, u32 pd, int buffer_size_shift,
 	mpt_entry->start     = cpu_to_be64(iova);
 	mpt_entry->length    = cpu_to_be64(total_size);
 
-	memset(&mpt_entry->lkey, 0,
-	       sizeof *mpt_entry - offsetof(struct mthca_mpt_entry, lkey));
+	memset_after(mpt_entry, 0, length);
 
 	if (mr->mtt)
 		mpt_entry->mtt_seg =
-- 
2.30.2

