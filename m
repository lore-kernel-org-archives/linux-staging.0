Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D756E3480
	for <linux-staging@lists.linux.dev>; Fri,  6 Aug 2021 20:14:24 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id dw2-20020a17090b0942b0290177cb475142so24380436pjb.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Aug 2021 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gPJ8NsKS+3Jw4kxc6WCHLzF/A70YlZNDecLhVvyEwVw=;
        b=NdOURHyDJZvSh8If1c7MyBRCht7XlsW8r2HtcVAVLUUWoZmmb6rVJdGcw9CANoRI6J
         tN4WH3v3iQv+ngKFN+eTeHi5IwsFf7MdKjVxLsRHC2An9rllNl6suYGF+oUWh3d4wM+4
         vNb9dykCBuSZqDfOuwvYjxHcnqP+Y7CAXB+WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gPJ8NsKS+3Jw4kxc6WCHLzF/A70YlZNDecLhVvyEwVw=;
        b=iERhvCMW4r0sOattl6rXkSrJAvcNwaW5nNtpiR691smuTYuM/kVcR1xmYOXbC8Xeef
         VLGd14kREHenkRioCb4U1FnPvrbj7dQoXugGiKu8V0hH+/Kl6+WhzYfx38NGRjOjSCrX
         8lWZ3E7ykiC896T3JcOiQLzfrTD4ZUkoG9UfgCKSSdF+ng+oouL7piE11eZwntQ/KqNt
         2KFieNFe6FCgovfrfFzeE3kgs6xpJB9TJZ0I8o/X9u0aV4xENG6oxxBdM8AoQicZ0Nb+
         zCyjsQUzJkx1oqozQSjJKP9pqsOBgQ7N5a0wQ/P7XQNo/ScYVMxKeozoHjPizykobLqY
         i1GQ==
X-Gm-Message-State: AOAM5328R9H2cgNcr2wABITtyx0J4WutzTf+JZYYQ1jLO6fqZPqOz+xV
	KR1RDDxl5I0DLd8YdxYNcoI4hA==
X-Google-Smtp-Source: ABdhPJxxlITo6nirtimXf9fsmMsyNhsNe6iZOd6Asay/tIW2ItUL1ICQexCsZ8sZV+5aL8qA97a+yg==
X-Received: by 2002:aa7:8246:0:b029:39a:1e0a:cd48 with SMTP id e6-20020aa782460000b029039a1e0acd48mr12338144pfn.14.1628280864501;
        Fri, 06 Aug 2021 13:14:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a35sm12580854pgm.66.2021.08.06.13.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 13:14:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	Joe Perches <joe@perches.com>,
	devel@driverdev.osuosl.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Avoid field-overflowing memcpy()
Date: Fri,  6 Aug 2021 13:14:22 -0700
Message-Id: <20210806201422.2871679-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599; h=from:subject; bh=N0zJZJw4fEfLxgkALcFP9+bOoMIMACrM/hpsApeDvnI=; b=owEBbAKT/ZANAwAKAYly9N/cbcAmAcsmYgBhDZgdacn85cUJLT9+vjP4fZ1DEL36WLydwIVHYdNs rrmiePqJAjIEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQ2YHQAKCRCJcvTf3G3AJkCGD/ iUCT4C9PmKd9Cp68qNLOPT9cs4Sq4vUB0OAch0yQGtn/cHWpgjrSWVikOFA30ueW1pejMqIGHjwEfe uv0f5pcGAL6VB4sQ9zJP71HbfTsFPcTfJexGZMln9z98VlYwY1kN3wvOacp8fENVdE+EBx8sX3RJrW 4cGwdNARI8qGoFxO3xVkM1Ct3zVLgv0jBwXLIh+aQqPZ/htj0Nsz6QPnnFrgSt+oI6cihyNMjONwFQ E0/NDE4V0ZlqJHDgZp1KgM/PJr+BokVI7vYwCSP1Y28WRcck6NGIhOBl0ICAfkz/q26rzf+/3JsC9P Moth1SRuh89E7iz3gk1sV3upvmmGIVKGajM7Cuput472O/SQ7GH3KSFSkmNB5SbpHm+CFl6gEfaKLq LwufREyQVcs4/k2tKjVu/ua9p3TpoUon2rhZxbX7t3Rwmxc4arveTZeifdY4T5xl089sRHM9Hs/0GN EpMxrG9f9mEdw2ieFjyXSghZcoZFHNhoz0YdrQgao+JN7LyLbABYxKvlxr0XorXGkbn6GCOzBVuP2Y EJgmlcjiE0iVIcAgfpgE7niA44YNoBeCjxutXzAbhWSucrlud9JXoqYXlK9VlA6679p9TBjkNyObC8 dCZQw/U/n7z64h/+6pKRjssEYzakpEDkEV9MaNOySixUsyHxruB4HHhK6V
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Adjust memcpy() destination to be the named structure itself, rather than
the first member, allowing memcpy() to correctly reason about the size.

"objdump -d" shows no object code changes.

Cc: Ross Schmidt <ross.schm.dev@gmail.com>
Cc: Joe Perches <joe@perches.com>
Cc: devel@driverdev.osuosl.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Hi Greg, since I've split out some other patches from my series, it made
sense to send this one directly too. You originally Acked it here:
https://lore.kernel.org/lkml/YQDvM4r2KomO9p+J@kroah.com
But since it has no dependencies on my tree, you can take it directly. :)
Thanks!
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ed13bf765d2..e0cee51224ff 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2389,7 +2389,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	}
 
 	/* fill default supported_mcs_set */
-	memcpy(ht_capie.mcs.rx_mask, pmlmeext->default_supported_mcs_set, 16);
+	memcpy(&ht_capie.mcs, pmlmeext->default_supported_mcs_set, 16);
 
 	/* update default supported_mcs_set */
 	rtw_hal_get_hwreg(padapter, HW_VAR_RF_TYPE, (u8 *)(&rf_type));
-- 
2.30.2

