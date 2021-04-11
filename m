Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8225B72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:34:58 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso7199315pji.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=eAzRDo314DwpqSCtRrPdwq25STQ7t6umx171HFgVOI0=;
        b=orIBLZrCQ1yR8fZVZ7PQqeOKJ0Eh3FJXa4s/ZtA6pN7GmzdapVBnOESR7Tf9piSq1L
         HX22/DvkFoWAFpKhQcw3Xh42PfGo9v9RqxvPlfg8AFb3O17WTpjL408y6ftl312Ln9Xx
         56F59aEg0XRs+Py05UVo+TZC9Rl7xBwHkRibynOi/gu0jxqbKt7MPMDgkCM3G9Rm2Unu
         AwwotyDjP2tHM004yf5T4dtCsDRikzntsl/iJx4Lki2q3aLFtKAvYbj/78TqqcGf+SKs
         qgguSvKpcdGWb0M4Rlljlrz38EJ1+txy/R4gSqOmWaKDYBkO+JxBhNHfxhwzDmTAl8lp
         ToeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=eAzRDo314DwpqSCtRrPdwq25STQ7t6umx171HFgVOI0=;
        b=CfhIf9uXzpwlS+7NxR99HmP4NBR4lwZG/lhWH0xcWaqqAeQhtLM1hbD5zRBK1+k5sz
         hU7hOKnnzgOcj5oSs7BpiNq1y7Kq6TzPBzRyF4336L6cOgI2DNucnPEwtTcYpyj6B0xC
         eaGJuLv/wb9XMxMl0xN18kE5qY7rJKhZcOXke7K3Bkzo2VYiBSKQv5HwYemZYLfiG/ZA
         O7m7MOUvybFs/5M8WLqQwh9gP09AwiAOuTehz5ShONNfnTF6MUX+BOOH78zzwaVLI0bQ
         jmV66nlGJQE/fcgljObqQRuhrETYdPcdEW/JW+QtTVGa79IU53n3jcF1upNmMpgzEv+8
         +tjQ==
X-Gm-Message-State: AOAM53347IDB1Q8kAkQVvWpviM2kFURo/GUjyNhJYJ+J+Km8BoFibaXN
	MY7tC5nnHJgDvMqH+EuSOek=
X-Google-Smtp-Source: ABdhPJxtau/JY52m+cPCRn0600HaqksTK+/k8p78h+nWt/x9rZynxokupybw7lO9amhzYnZOax35Jw==
X-Received: by 2002:a17:90a:bb86:: with SMTP id v6mr23601738pjr.37.1618140897928;
        Sun, 11 Apr 2021 04:34:57 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id 129sm5120429pgi.76.2021.04.11.04.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 04:34:57 -0700 (PDT)
Date: Sun, 11 Apr 2021 17:04:46 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4 0/3] staging: rtl8192e: modified log message
Message-ID: <cover.1618139271.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes style issues
Changes from v3:-
[PATCH v3 1/3]:- Modified log message.
[PATCH V3 2/3]:- No changes.
[PATCH v3 3/3]:- No changes

Changes from v2:-
[PATCH v2 1/3]:- Modified subject description.
[PATCH V2 2/3]:- No changes.
[PATCH v2 3/3]:- Rectified spelling mistake in subject description.

Changes from v1:-
[PATCH 1/3]:- Removed unnecessary parentheses around boolean expression.
Changes has been made in v2.
[PATCH 2/3]:- No changes.
[PATCH 3/3]:- No changes.

Mitali Borkar (3):
staging: rtl8192e: remove parentheses around boolean expression
staging: rtl8192e: remove unnecessary ftrace-like logging
staging: rtl8192e: remove unnecessary parentheses

drivers/staging/rtl8192e/rtl819x_HTProc.c | 18 ++-
1 files changed, 7 insertions(+), 11 deletions(-)


-- 
2.30.2

