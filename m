Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39143BF68F
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 21:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708256; cv=none; b=crlfjXHmCQSAZrvJTHhfofsVsp0OPcSN6db6PCQ5KidV1FJUSRaOCM+VttQ0MoLDsMrwR20Svij25b3I3O7itWbCtDkkySCu76MGUzfmARgvLcaq2oq6kBL6CrFWvvGOerzPR1QwUwNsA7SLH1y/rfvb/Bg3gWcKQzdC6k8D2EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708256; c=relaxed/simple;
	bh=x7a9np1CgZA2aIx4cthJhrEuEkmMZORN2+AT1ME0wJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tffbQSzBandC0qvahzj0A+psmTiHOPEjEikLmNGmxJMnXAmPCBD1rVdzx7W+wpPeUegTAcZmIw/dj05B5DNdNhGgsTBAWHP0Ml6qH0PY+mg6RPvAsXWDEprlaEjbjYQLOzShF0+gg6PLD74jA9gRLHt4o5O9SF3NH0uMEjGqWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sv4DUo/i; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sv4DUo/i"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f30a4601bbso7977689eec.1
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778708254; x=1779313054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mhrJufOBSvv8SlQ4Qe3tzj7M3hAlc/9/Fo8jcw5NrM=;
        b=sv4DUo/iMXHjF1UNbuAUx+fL/C9q1SerXR42K2XvOLHL5z4z+i1BX5GMkv+f39e50u
         nmi8SqVjxe0cIg6orTEvS1K6NN4HYMMA7nkz5p25IbFSgaZwJNVUec0cRtepJ4/Fj1Cn
         eoFschZjimlEOmssdrv9LsnBtILb+CIIG9xKkA65Wno4lhq7A/uqxF6xkICDs3Om6IbP
         mzPmAPA46izfxFHwd4+DM48i7macaIZV3qoEOLdJdx2DHIpj8DT/s5Ly2CjxvDi9+pPG
         k4NBqIefUew8bCBKIus5dJgQXdfPJjEtlvnphaw5X6tLvqrRlDd7tn4shYbTwWtH6enl
         pFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778708254; x=1779313054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mhrJufOBSvv8SlQ4Qe3tzj7M3hAlc/9/Fo8jcw5NrM=;
        b=m6f1LbOW7uTCj2qejPZEkAXBO7A1qdmqV+qI+RLcgpxQWsRoMAuKD38lo0DPB/bWBr
         EqE3Neh7URdVQl7MP/s+YjIKr41HULt/ylyfEYpwiHI/c2Qf8ozOFsoMngoMfEKkY6vU
         SP4AvDkCYUh+2/cJLXrLnZxgXjKe1yd1cIPGd5EhL6q+RYmG3tmHr1Lc43yXo1n3fJh6
         hBojRrAkuEPRigSyqP74lA9Rl5ngghEYjYKZTos+kI/PA4rG6vcSkibH2jYaYNfwSDsr
         3GZSxetFDpLOYCKWdfyDGoTo/P7r2Q538tdBks9ekyG6MgxTXbPrDPd9Sep/+EIdN+We
         bXJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nP+/VYQTTKn5J7nOaUarez1lQi07Rgin/g8eZQn33fJBD06ahlweRf1K379EcqzAmP4muDR9oX0nkF/67@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/eY4l98IVO1CX86NvupV+XuCJHlVvdkGxNKd1LV5Cdz8llOqf
	f83VHP6eH6rOY5ZOrB+CmE0Cq/Fr5Qa0OWa52lDdK1LIK+Tl6kVzEuIU
X-Gm-Gg: Acq92OH9NreU4z4iTf4XJgCJh2sw3RDokYha+zPizYOKrEvpPzBEADFvdJr6BxrQxvd
	Cno6OixZAOuGellx/G/hQ+TiwyCFUL2IAE4XBpNMDLGGVmugFmTHjveS4spx3dg/B5lcw2skK97
	lMTK1+yR5oczHtw3c0+PqZUrXdB1DjD9pfH8mHzdqOZdawrxmUige9uSQHqjk2TjptDW374sgg+
	4GR6FyvqJYeWozp16b2Xhw3HhtWcHhgwxr9sZWqoQj+Zhpr2nakPocyU0ey3AuS4TqLlTviLHbk
	bnG82Z8PW1tdH1WjJxqvzqwlDPEIW8lY+EX2ObKbWIfQiEYwsP8yCOa3rmlpzH8GrGcgT1fwzQp
	oFGa3MM1ptnX2BJM5xGNaKdYPRrHbKpOTdX7AoCxr2NIbLqaN+Jr3fAtYXcosunfi0MaEdivBf0
	fO3K4E4vdbueY2FbkXqXVEv5LB5dy2tGy1Az4z1kmu1IzBJCJzAS7HaEj7AOZpoyWabQ==
X-Received: by 2002:a05:7300:a505:b0:2dd:6937:79cb with SMTP id 5a478bee46e88-301542a8296mr2788730eec.12.1778708253861;
        Wed, 13 May 2026 14:37:33 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e69esm732316eec.1.2026.05.13.14.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:37:33 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: make _rtw_enqueue_cmd static
Date: Wed, 13 May 2026 21:37:17 +0000
Message-Id: <20260513213719.12246-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513213719.12246-2-dennylin0707@gmail.com>
References: <20260513213719.12246-1-dennylin0707@gmail.com>
 <20260513213719.12246-2-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function _rtw_enqueue_cmd() is only used within rtw_cmd.c,
so make it static and remove the unnecessary declaration from
the header file.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 2 +-
 drivers/staging/rtl8723bs/include/cmd_osdep.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 654f0aa72263..0cf80408b7ab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -247,7 +247,7 @@ void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
  *
  */
 
-int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
+static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 {
 	unsigned long irqL;
 
diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
index 41daa3c339a8..91d933d71945 100644
--- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
+++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
@@ -11,7 +11,6 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
 extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
 extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
-int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj);
 extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
 
 #endif
-- 
2.34.1

