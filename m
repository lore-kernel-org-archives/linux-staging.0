Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A74A2D
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 15:24:27 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a70so3025467edf.10
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date;
        bh=+tgCQNlrJBIJnFZktIjnzR8zOnXjEUkMb3MwFUQzmLI=;
        b=p1E9tA7OQG03ngYTlzq1WWfVaZKP9PgOYShijUuAPh+QnzbL2pNJMJg9njJI9BOXUF
         X+07IOzw9FbuCpu//xKKmWVBSlDEYVPWabXU5jrmS6O8gAVZFuhhnE/u7Uf3IH5ZbQ3W
         nNTMZUCT0BPwwXJTL9yViQ962feG2ImxKd6WzKhoIZMCv+yfqeKfJIme1VKG1kluW6+N
         GroPA2L1Kigxsvmg1DUZf3IhlyU5jsr2M/9d3TtU5Qvhxs1isvacqTHxe+zTFz6nWuhG
         s+YF+T2QlucYpH51BULRFELlfZvv+TG0NS1Rx4+p6w4lh/oWJLZwosvPFzsymGUcFRp1
         7PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+tgCQNlrJBIJnFZktIjnzR8zOnXjEUkMb3MwFUQzmLI=;
        b=y8lKjpK40F2R7ojAICtkKAyPqM2XQdmWeUZHgVPcIdqlWkk3CwgHRDH+OjhoQcwJJv
         xN/DyG4950mXmjxy2L0Hna7ZyCKfmt5lbXwKJfcPQA/H23ZPZ+J66Afwun963R8lDU05
         FKEPdbKhztdDU/iR3KlJq/EbEK6d5p4wbJ6nnNwlCNk8WWCG+TQw71KCq6uPvn8T5WnB
         Nz42uWCwbsOUV10KALA91D37O/uUoWTl+LcvldTZOPehhDwSddwtDbC7Hc8Ch6Kpq4mn
         Pb2/25PIbRXEK2Y8ZXRAaln19knBWWvjtk9CBnvLlhAoNVFVDsHZaE+vdDhwpnsC9DK5
         tYrA==
X-Gm-Message-State: ACgBeo2pvSxYW337bFP3UWfrK/T2+4A/mZUFZP9ra1ksVNgezhdAg2Dj
	U/SZxo/jWPvG5sy5Ba3uvOoFjZU+Mn8UIEWF
X-Google-Smtp-Source: AA6agR6Oijo4pfbEgVyRppnjnyJ8xgrFiu1v3J9OQxrDhAmJWrMZ51+gb5ZnHbFi3L70gLrWPzUweg==
X-Received: by 2002:a05:6402:24a4:b0:440:8c0c:8d2b with SMTP id q36-20020a05640224a400b004408c0c8d2bmr11671587eda.311.1662737065652;
        Fri, 09 Sep 2022 08:24:25 -0700 (PDT)
Received: from localhost ([89.40.126.93])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906051700b0073d53f4e053sm403536eja.104.2022.09.09.08.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:24:24 -0700 (PDT)
Message-ID: <631b5aa8.170a0220.9378b.124a@mx.google.com>
X-Google-Original-Message-ID: <YxuEzfVSEmBrsAR4@<DarkDistro>>
Date: Fri, 9 Sep 2022 18:24:13 +0000
From: Burak Ozdemir <bozdemir@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: Fix string form declaration
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Burak Ozdemir <bozdemir@gmail.com>

Use correct string form declaration, prevent extra variable
declaration in final assembly output.

Signed-off-by: Burak Ozdemir <bozdemir@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index df02335fdbab..70b3709acbb2 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1105,7 +1105,7 @@ static int pi433_debugfs_regs_show(struct seq_file *m, void *p)
 	struct pi433_device *dev;
 	u8 reg_data[114];
 	int i;
-	char *fmt = "0x%02x, 0x%02x\n";
+	static const char fmt[] = "0x%02x, 0x%02x\n";
 	int ret;
 
 	dev = m->private;
-- 
2.35.1

