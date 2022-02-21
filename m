Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2907D2568
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 21:25:09 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id p14so36354745ejf.11
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 13:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Oauo1b7HT73p7Gr1WROI5Ol6cUloVjrlNqIzfwLAH/Y=;
        b=qtDA+iJMSbeae+4uVqNcUJeGpB0jUbHeP+Z/CRB55izmjZBEeHLuRBuE7pxkTR8piY
         LmNUU9sysUfzKHzgLUYQ1BCvuw34D8vMmhkq2sTJhLZAiM4cz9PdG3h3VGOgn32aGGLi
         Dhm0uYXhKRl7f9hlF3OuUClNj3vFLBUkrEKlpB1Sjqb9HApqr2bG+dOzLoaXYAyrzW3C
         9k5Sht3x5lqVh04VlKNP1ic1Gunbv/oPpxnUTuWYPgnoPHuz3WLPZISfW+grsngacH6y
         Nma/d0rQ5DeM5P3ceyXJZlgJVdaJc9kIc5fYxvoNlqcJqJgZEMnuFhF0o7BB9yZRVGwp
         8vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oauo1b7HT73p7Gr1WROI5Ol6cUloVjrlNqIzfwLAH/Y=;
        b=ho2uUYdKNlhNDilstl3aWl7qJycsjU/aM0knopzY5YhgUBdeOJgPIKVW4n1j34Gi/o
         ri/h+uW7JWJH+ob368HqDTVZYOlXV0aJ5AlbZsZeeGLeDVWQkSnFweUsZm2nxVSwuhCp
         RgroQqlW/qHoyclMSKTe71kMLDVQldQR4sn1+8rexGaXz5ZvWgkPFw/M1EEEwxnzZ0aC
         7yr+mH4SQL+/DT6sUb+Nm0usxsRKn/LEeMSoHZXb7sTVGQepDQn7HrVXxn48nlDQY1bW
         J4Ndvt38fWoUoS/uUYBFbBHE9v8moHcRTQTwfy+GT/J7y7+T8F467z+ktPAinHNc8CRu
         6Ayw==
X-Gm-Message-State: AOAM530gNGzmZ5U7R+d1e4nKu0BX5SbKIQUjBBU/vL6w5Gqj2/MMB/gv
	C5ty2jy9sTwZrjff5NSaCn8=
X-Google-Smtp-Source: ABdhPJyKDULWkIgC0AqNbiYLCH6Pf/SIodgvrqrgbYRagMi4siuwq0/bpO5ZkNczpb4tMCU2nDEcPg==
X-Received: by 2002:a17:906:6693:b0:6cf:3cb:89c9 with SMTP id z19-20020a170906669300b006cf03cb89c9mr17455135ejo.23.1645478707569;
        Mon, 21 Feb 2022 13:25:07 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id vs2sm5421682ejb.64.2022.02.21.13.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:25:07 -0800 (PST)
Date: Mon, 21 Feb 2022 22:25:05 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] staging: vt6656: Add comment for locks
Message-ID: <c6a5ef8e7704b488c54145b09ac44bd4880c13b4.1645477326.git.philipp.g.hortmann@gmail.com>
References: <cover.1645477326.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1645477326.git.philipp.g.hortmann@gmail.com>

This patch fixes the checkpatch.pl warnings like:
- CHECK: spinlock_t definition without comment

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Devided patch into three patches
---
 drivers/staging/vt6656/device.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6656/device.h b/drivers/staging/vt6656/device.h
index 8b6623a751f0..dda38c2a6f06 100644
--- a/drivers/staging/vt6656/device.h
+++ b/drivers/staging/vt6656/device.h
@@ -268,8 +268,8 @@ struct vnt_private {
 	u32 rx_buf_sz;
 	int mc_list_count;
 
-	spinlock_t lock;
-	struct mutex usb_lock;
+	spinlock_t lock;		/* prepare tx USB URB */
+	struct mutex usb_lock;		/* USB control messages */
 
 	unsigned long flags;
 
-- 
2.25.1

