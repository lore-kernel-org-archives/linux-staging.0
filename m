Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B03C6D22
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:06:06 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id a21so1069975pfh.5
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 23:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bf2aGZjkA9ZdJwTs2unG/S+9qMUhCrqY/7iHdHkH31E=;
        b=A5I0FSkL7KTi0It4kgEm27RXwjzTjYiZalV5qb+BVbRkycsgZ6clnB+HMIO88/Lahs
         zUfCqQaTXkbN7vGog/kgYObDuP3sM9ypsYZBTKoYz0zdY2laHeTI6MGbyFuVzp/UhIbz
         SA33K0vtCtLYBcIuPH619Gf/JvwDe9tUUYn/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bf2aGZjkA9ZdJwTs2unG/S+9qMUhCrqY/7iHdHkH31E=;
        b=fr49UAX6PSFDZkJfmcYYN4urtfA36wdg8xIXWg1C/2PPvDwfqMVFkg58qHf4uPITvz
         zyDmxSRPvclE/FAuo63dBdUwZy/pjA64tJ7l91cfoyjfNEFtIoDCRfbV31ZdJ01II9h0
         2+TAjG9TQPc5+XIC9I1I+uvRXuKBsLXJn41qJgkN7xqae/5po8T1uBv7IAosoJgOF6j1
         Jj5Xo4hBPYyiYb4Cup16PObqp1Uv/VBPgtWYaT9MC8yPI1O4bwymlv+JTR01Jq8QK7vR
         +2c1fGbVVSIjRb1keAg09bIVtQj5bIZ8u051Js0mE1k4v5SG9nfQlk7vMUuONFJmreEr
         568g==
X-Gm-Message-State: AOAM531s/FbPB/bB1qt4p+6Rgb5x9CoeZ6bDJPbh3Ch0kQaq2gbxx+aM
	M7KwNLIHiRQ/JQ/ae+H/jgKOWQ==
X-Google-Smtp-Source: ABdhPJzIwbxoplLwgyMwAYMY+AYzEbGav9ejSeaA2oSrg/gnLSdaifU6G3gvCszWYv19xo6NLd4rnA==
X-Received: by 2002:a63:101c:: with SMTP id f28mr7267532pgl.330.1629266766044;
        Tue, 17 Aug 2021 23:06:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c9sm5531358pgq.58.2021.08.17.23.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:06:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Julian Wiedmann <jwi@linux.ibm.com>,
	Karsten Graul <kgraul@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-wireless@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 60/63] net/af_iucv: Use struct_group() to zero struct iucv_sock region
Date: Tue, 17 Aug 2021 23:05:30 -0700
Message-Id: <20210818060533.3569517-61-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231; h=from:subject; bh=bmKbsRP16CnR5PXdPB4ZiDx9DBCysB2r4z9hIIKiJic=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMrUiy3wzC2Tbpf2LUdDadDtk7FYIB+hFtnsIrW fkTfIlqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKwAKCRCJcvTf3G3AJkYyD/ 9ucWeKdq8Xqqc/QXVsAWFOW9NzYhLInbMDw4OW5CozZyRbnOPk352gq63xaqMFMsclZFLEMQ9TTO33 7OYOFG7yKLJH7xWiqIvXwLztLuZw+JXSioGcmPOGOtg8hAXa8jiQ1KixmMPPGspos7hxqSuEzt31Y0 tNY4L/eDOvurxWrZsBGWm1b1k5PsAc+g8zMvnFzCBDhHj7YU0n+DSqAqBOzdrAc/BDQ6WwCtZWZgHn VVMCXM0qPf/ljXYEYnUK+ZZnl/WfbDvNoDPpsLQ0zZXhIhNtT3BKEfer/GfabdgopxSGXxTV+7JLfW 4zvjCOjHDppWfw99ppMZmvMvDN3k26ttKsLH7cVJ+kxEk9IZohT1lAGOfHEd7n+qAs4B4SrYMGb0uM wnIP+9JGQlViNQCZz8651n9z1vC3LX6PQlO5oS2pjadtH/dqxOhmIw392G3ODhOfboU0ZOnPR3pfTA vv8hjA/ukE5Dt/9T5+e3XaDNef7XzWGuEJy//3iyWc+lV/f+ruPwosN4rWo7gnyIbF2CgCgdasK6ZN PvgpQFRdA0UU/KoP4B9xx0S3rtUne33iTi/VsaHcMSUoisF52ghW2rt/M1apXDnx8RSFOroKKUUTSX 3+F+WfyISvDRWznlKXQ44kQRHNtJUEKNW8cFL9JBRk7SYT4Mh7lRv9p5s4KQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark the region of struct iucv_sock that gets
initialized to zero. Avoid the future warning:

In function 'fortify_memset_chk',
    inlined from 'iucv_sock_alloc' at net/iucv/af_iucv.c:476:2:
./include/linux/fortify-string.h:199:4: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
  199 |    __write_overflow_field(p_size_field, size);
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cc: Julian Wiedmann <jwi@linux.ibm.com>
Cc: Karsten Graul <kgraul@linux.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-s390@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/net/iucv/af_iucv.h | 10 ++++++----
 net/iucv/af_iucv.c         |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/net/iucv/af_iucv.h b/include/net/iucv/af_iucv.h
index ff06246dbbb9..df85d19fbf84 100644
--- a/include/net/iucv/af_iucv.h
+++ b/include/net/iucv/af_iucv.h
@@ -112,10 +112,12 @@ enum iucv_tx_notify {
 
 struct iucv_sock {
 	struct sock		sk;
-	char			src_user_id[8];
-	char			src_name[8];
-	char			dst_user_id[8];
-	char			dst_name[8];
+	struct_group(init,
+		char		src_user_id[8];
+		char		src_name[8];
+		char		dst_user_id[8];
+		char		dst_name[8];
+	);
 	struct list_head	accept_q;
 	spinlock_t		accept_q_lock;
 	struct sock		*parent;
diff --git a/net/iucv/af_iucv.c b/net/iucv/af_iucv.c
index 18316ee3c692..9446e2771d31 100644
--- a/net/iucv/af_iucv.c
+++ b/net/iucv/af_iucv.c
@@ -473,7 +473,7 @@ static struct sock *iucv_sock_alloc(struct socket *sock, int proto, gfp_t prio,
 	atomic_set(&iucv->msg_recv, 0);
 	iucv->path = NULL;
 	iucv->sk_txnotify = afiucv_hs_callback_txnotify;
-	memset(&iucv->src_user_id , 0, 32);
+	memset(&iucv->init, 0, sizeof(iucv->init));
 	if (pr_iucv)
 		iucv->transport = AF_IUCV_TRANS_IUCV;
 	else
-- 
2.30.2

