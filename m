Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBF5259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 22:24:49 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso9896066otp.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=7mopXWBi2wijSGKa4AiTjRSanyVNKQw/ECdzYkzyHBg=;
        b=TVG60R2H4bKieRfyglnQsIBgGK4c5WjLKncENtq0PCeTqi0D6q5ytdppV9OrFrcyfW
         HHH8bCRos+sm+98LPMbzfw9UHqsTBBg7s/QkgB1moRZ5iouugI0y+vNhwmbhAePnOB4i
         UHm7CwCPhCx4Va+74vAKzs/MYhDMCYVVJk5Niwvy5dk5Tb+bSMDd87VQEozlro4dyDG6
         AmPXEEKsjQqXG482qICSickkZGyHeqV/iHIPo8n5z2ogNCNr7F4BNBGtqg0y29ni41l5
         KgrHtAzgpk6axHm7eaSh7ZnahfnCXCwIhxpCHE4w7O1ko7h6Z3DhSzbH48qD+o6iYVPk
         2dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=7mopXWBi2wijSGKa4AiTjRSanyVNKQw/ECdzYkzyHBg=;
        b=BWL2cdXswD/Z4seQdlmprhTemyjSSw+Nlg/OBDkfAjfjEjqKZ+jRfLOZK5SFZYyaUQ
         Lbbh6atvwqhhTzBIfwti1PhZVxFjP13F6XKygX7hBenFP1y7QhhIBo6E+6nbZsdwmeh+
         hpKzJgew76qtX+bMNjS6dLvlOW3RT3h+LM/5m4qqJZEZl705hlMQW43fIJ9tb971+arg
         Req1ZMjQi2kWR7o8ZaXtVJVWH9bHE2lvdg+WJeZ4JufUCxb+M7exrPFMjtyPU4wGXGLf
         3sgFrJTZRp8N9bCuTOLvxgl0oxCBKy7samh2WvdqN70qlcsLeCp3MyrdPghZR5Wg/0J/
         3ATg==
X-Gm-Message-State: AOAM532FzwdRY4kHf1H3UQiY1qfTPH1z1rN79Ef/3zyzj10Psy0tMNrL
	8IsoFd3I+FpxkrdbQ8PCXUo=
X-Google-Smtp-Source: ABdhPJxD6prBgFyahJBLuz/JwVFWQaAr1RfWSibZEFa/57wziYI+4OJwVB+xK+3mf1B5TIarlh4DHQ==
X-Received: by 2002:a9d:2e1:: with SMTP id 88mr19725255otl.120.1617575088397;
        Sun, 04 Apr 2021 15:24:48 -0700 (PDT)
Received: from fedora ([2806:2f0:7000:86b1:c1bc:6875:f962:d652])
        by smtp.gmail.com with ESMTPSA id h59sm3528290otb.29.2021.04.04.15.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 15:24:48 -0700 (PDT)
Date: Sun, 4 Apr 2021 17:24:43 -0500
From: David Villasana =?iso-8859-1?Q?Jim=E9nez?= <davidvillasana14@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: iio: cdc: remove repeated word
Message-ID: <YGo8q4R5dqgtDMlg@fedora>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Fix checkpatch warning:
WARNING: Possible repeated word: 'from'

Signed-off-by: David Villasana Jiménez <davidvillasana14@gmail.com>
---
 drivers/staging/iio/cdc/ad7150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/cdc/ad7150.c b/drivers/staging/iio/cdc/ad7150.c
index 48132ab157ef..1be214512ff8 100644
--- a/drivers/staging/iio/cdc/ad7150.c
+++ b/drivers/staging/iio/cdc/ad7150.c
@@ -57,7 +57,7 @@
  * @threshold: thresholds for simple capacitance value events
  * @thresh_sensitivity: threshold for simple capacitance offset
  *	from 'average' value.
- * @mag_sensitity: threshold for magnitude of capacitance offset from
+ * @mag_sensitity: threshold for magnitude of capacitance offset
  *	from 'average' value.
  * @thresh_timeout: a timeout, in samples from the moment an
  *	adaptive threshold event occurs to when the average
-- 
2.30.2

