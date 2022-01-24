Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3A168
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 04:25:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id c9so14318382plg.11
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=ZlU1YtCb74/PtHVtb3Wm72htYLoYfou/n0ndVPahqMo=;
        b=cFh9wd8QHdgybiAXNs5slP4x0Jd1PdRGLD4dFpNPhVZBV0CDFFj8KJKSRCfdYxUxq1
         j1VlZmQLmzmReho992xqVu6bqpAwSbZ+On5mQbYskbRcijkmmCiIrXYebbAr5OYNQmbC
         Z1WSvhfe9RxLxBiLdG1pcZoBGAemQAbETj262+B80QyvhV4ZL1d9zq9ay+bbpC6EoLAt
         B6lxi2KiXjwGl0xXikwDudX5jc8kq0H1pyFRd4nlQHqjrqNci/b5tshRCTQR7gWov38o
         IiAPBjPrz64oOtzBxGHJBn5o/GuAPT5feQTgeP+6wJZwNTgkfPVjsZzyPRX5gYF54iNB
         ZB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=ZlU1YtCb74/PtHVtb3Wm72htYLoYfou/n0ndVPahqMo=;
        b=5yWuipNlNzLSpH8fY+dLL7cKbNTFEJCv8znpCX6tCWaRcY6/yie9g1zrmzDkRv1Wnv
         BsBVUBFjVagNkcrpn1m/4vCfhzpYZwNmuDWkoir7dBMI0BhFU9zywPw+Si9Pioen0l55
         mM/709LAAI6MpFcbDdx7QnFauH62p0Wgno0mD7jF6ciDaO6cqULKUTdTt2BB67RBxskh
         nBTp76L86RrY/ZZFHsDteqhNXkjiP6Hg/snJf8iLaHgaRzd2+xv5DH4+Ow/leFAL7W7I
         ZWp5y9ggglblHHOpWb+iziWjESIP0DgirhNsbckQ5EDVXbgWcQzVZMwKGbOurUsQh/lY
         Mrlg==
X-Gm-Message-State: AOAM531zHM73QkIYcjGfo+wsPGtZD9/nZHOKv4cpxP1WpxZxexaEoioj
	RkV+jQCZuAIsDmMTIbXr4Yc=
X-Google-Smtp-Source: ABdhPJyoCy0ihQOCnsJ3kzsjLAsnG6piJqPMecFfqiT5oxhTHa0FoC1T8tIURomLQKFoRg2hzg3rMA==
X-Received: by 2002:a17:902:c40d:b0:14a:96a4:1044 with SMTP id k13-20020a170902c40d00b0014a96a41044mr13150581plk.50.1642998312280;
        Sun, 23 Jan 2022 20:25:12 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id lt17sm11265936pjb.41.2022.01.23.20.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 20:25:11 -0800 (PST)
Date: Mon, 24 Jan 2022 17:25:06 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: pi433: add debugfs interface
Message-ID: <20220124042506.GA7662@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ye06GfUzwzQBvfLy@kroah.com>

When troubleshooting RF applications, one of the most common approaches 
is to ensure that both sides of the communication path are using the 
same configuration such as bit rate, frequency deviation, encryption key,
sync words and so on.

The existing driver implementation doesn't allow the user to see which 
values have been configured onto the uC which makes trobleshooting more 
painful than it needs to be.

This patchset adds debugfs interface to this driver and exposes a 
read-only access to uC reg values to address that problem.

Patch dependency:

This series depend on these patches as they change the same set of files:

- https://lore.kernel.org/lkml/20220108212728.GA7784@mail.google.com/
- https://lore.kernel.org/lkml/20220114221643.GA7843@mail.google.com/ 
- https://lore.kernel.org/lkml/20220118230312.GA4826@mail.google.com/

Changelog:

v2: remove redudant references to dentry pointers in the code and perform 
     debugsfs_lookup instead. Req: Greg k-h  
v1: https://lore.kernel.org/lkml/20220123073855.GA79453@mail.google.com/

Paulo Miguel Almeida (2):
  staging: pi433: add missing register contants
  staging: pi433: add debugfs interface

 drivers/staging/pi433/pi433_if.c       | 80 ++++++++++++++++++++++++++
 drivers/staging/pi433/rf69.c           |  2 +-
 drivers/staging/pi433/rf69.h           |  1 +
 drivers/staging/pi433/rf69_registers.h |  2 +
 4 files changed, 84 insertions(+), 1 deletion(-)

-- 
2.25.4

