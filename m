Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57772
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 10:44:02 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id i4so6426014pjk.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 03:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nfSnDyKH8eQyblcVTBktK3kbpdYMJZiJC2JxbskSzHw=;
        b=LjAUt+sq2bBQByg90jwnPgHNjJt8VwRb+Czau/fcSUfKl8MXfbn5XkBeny3hL8WoiN
         GKzSiYFfVgDaNSWoReOQ3208Fhp4hTGe8Os6jga1nGNoLRx8AI8IDVwoX208TgY4aaN2
         LnCpqOOwAQwl+Ir7PbP5+AUDXatcs4FAjPseeJFd6KUT4dHY4EZ1yq2yaUI5/LFQV1W9
         u7EBHziZRtDxqK2fkLLu1/Vo/6jvHKBhETpHPDqHQ/+JmLtbFQCWFlVubEi+YJWx8S+T
         bmmZ2mgEASbRqRNRcuCJ7OKvcFPoIvekXET/be31nslbmc2/euO47ht/C3Tk+MJwnd0M
         rk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nfSnDyKH8eQyblcVTBktK3kbpdYMJZiJC2JxbskSzHw=;
        b=C139WKr6zxsjn44jmIPGpQb7aMe8wcXHyuQjeHpXy7I31opxjnIo6qEGXxnZIraUUZ
         9Wz473rkr8bAuqyR02vIyCDQDOijcV8XNY/uNOl+zTkrfnkbZM/1bJm/AI2Cfm39V8p1
         avtrbjarODWoSSM5cTjOprtttt0ZnVpLjCzyrsCjY2cRSp9XougkEUx3mB5iieeaj8kL
         ltM/WhP1vpaxfP9tiBXnpVn8Izs0asVfVE+p0Jf7vdY/LFpROQiep9aZQ3in/tQI2F3C
         Wp+Q4SbOPrL4Hh1jbnfZs1s+0Unt6yV0VMpYYVXAWUAniwf+P4yzPLvSJ799U85bGR4N
         Rbcw==
X-Gm-Message-State: AOAM532cVc3LFi6OwN/9VByvjuMJIl+SxPJdkFDRu3PWoG8wcLel3WDm
	ifQJZP4xLyecX+IrfwVXTj8=
X-Google-Smtp-Source: ABdhPJy1sJjJMZb3JF3C/YE+UzV7C9XvFVrV16gUrCjy4nwVDdnBRKSn8WRrC9bYAYiIGP1BlaVqIw==
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr23074230pjr.179.1618224241916;
        Mon, 12 Apr 2021 03:44:01 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id 184sm9695577pfx.156.2021.04.12.03.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 03:44:01 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:13:54 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: nsaenzjulienne@susu.de, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 0/2] staging: vc04_services: cleanup patchset for style
 issues
Message-ID: <cover.1618223171.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes from v1:- Threaded mails properly and changed the subject line
to match prefix on patches.
[PATCH 1/2]:- No changes.
[PATCH 2/2]:- No changes.

Mitali Borkar (2):
  staging: vc04_services: remove trailing whitespace
  staging: vc04_services: rectify spelling mistake

 drivers/staging/vc04_services/interface/TODO | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.30.2

