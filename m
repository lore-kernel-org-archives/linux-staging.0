Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0166172
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 11:21:14 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id i4so6471503pjk.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=WxFymkv1ReyBJIeSaYrMs9DALjw4Mde+TrIX6jgLR/A=;
        b=mU02UGTjy8WnCsjIBrTuIdTn6VlqvZ+TcMx+l0IwFrOl68I2/iT2qnUK59+L+c18SG
         LOk3jHz2BHBojlwRkGyI+xuG8DytqRFsGORbGwB4Goq9WkKGj9N0CLoixBP57ynJ016j
         zR0+bqhD21knLMjMDtKYigqFhm8j1YS9RyxHjM6RtMc/kWsvJVL00x2uytee5b8HVPnm
         ABNXOajLAsefIgB+eLgyv0WkxyGBlApPQ2GXuJ/rW3aN2sjhjOdrUJyvzjbJfErJ+5rk
         lZSCXJFS0B4Kmav7Rejy0gysYbEmu7iLqbbPThVLIPO87Uh2HDznmjq/AgRxfHBlFw7F
         GVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=WxFymkv1ReyBJIeSaYrMs9DALjw4Mde+TrIX6jgLR/A=;
        b=R0xWvoftebZkQVl4aYjKt1EZroq9/LbyojJkA52ufgR/WqImcZEaFEgBwbOxDZc+7Y
         Wisf2dkhTOmzkXFjoG/ZmsKMc1SL+xOxdgTTO9idhIpWr1rNmb2nsCk9B2UQ6EJMJ033
         zShmP9iN0GhxglJYHiXzsdls9UFAereH2Iohy1bB+U5bZAfTb1tOWVfnDcoBuMAqT2jE
         sdewhVuQnFzOaGpS+zAfyz3CZ3O/Kkn27271sqC0LX0mi5wzHwuPnjoz1iOA+/TTQe2M
         x1pkmKPVTo1Qp9y0uAPMtZuIcrZ4AZBhhQMkM780UE7AvMRAyyJduIbUWALLCr0grGb7
         ChdQ==
X-Gm-Message-State: AOAM530e/EyE7nlj68eqtbmySx/WUPdw6dcn2ox+Ac1n3xnpspdoCcQ1
	VpmNxWPuz8BN5Y/WVipy0Ok=
X-Google-Smtp-Source: ABdhPJzyMLeks7DbKTOd7eb7WQ/+Dtg+kzaWIqBjAyQyPkg/gUWgXCf69NKP97rYLTZoADhDeCfnzw==
X-Received: by 2002:a17:902:b70e:b029:e6:cef9:6486 with SMTP id d14-20020a170902b70eb02900e6cef96486mr26555304pls.18.1618226474418;
        Mon, 12 Apr 2021 04:21:14 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id d20sm9635615pfn.166.2021.04.12.04.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 04:21:13 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:51:06 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4 0/3] staging: rtl8192e: cleanup patchset for style issues
Message-ID: <cover.1618224838.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes from v3:- Changed subject line to match prefix on the patches.
[PATCH v3 1/3]:- No changes.
[PATCH v3 2/3]:- No changes.
[PATCH V3 3/3]:- No changes.

Changes from v2:-
[PATCH v2 1/3]:- Modified subject description. Changes has been made in
v3.
[PATCH v2 2/3]:- No changes.
[PATCH v2 3/3]:- Rectified spelling mistake in subject description.
Changes has been made in v3.

Changes from v1:-
[PATCH 1/3]:- Removed unnecessary parentheses around boolean expression.
Changes has been made in v2.
[PATCH 2/3]:- No changes.
[PATCH 3/3]:- No changes.

Mitali Borkar (6):
  staging: rtl8192e: remove parentheses around boolean expression
  staging: rtl8192e: remove unnecessary ftrace-like logging
  staging: rtl8192e: remove unnecessary parentheses

 drivers/staging/rtl8192e/rtl819x_HTProc.c     |  18 ++-
 1 file changed, 7 insertions(+), 11 deletions(-)

-- 
2.30.2

