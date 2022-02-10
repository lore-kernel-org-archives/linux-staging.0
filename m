Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0C529CA
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 10:16:31 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a8so14021721ejc.8
        for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 02:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cqd+nHAtyHPX1TFwEse8byzK8ys5i5RMjcpqTUGLpbY=;
        b=ZzQq1zGYJdLFyrdECQKUokfzSmpV8AqALMPLO487lPqoVwtNE3ikjy6gqgwnwpJ+xU
         dlmywpWlofAFYfYsu6oGnCUuSX/BKLw+aDeW8YK7gZqUfz8So29y1bznaQA4VtrNAZcA
         9yXqneAa99/xv4+GK3e59lboF7swv/mALq4i91wXZqGS4itER6DavxIQG0VjOEYPGavD
         peWfE52Wm4urJbKxbSk+M55S03CC/7ton5MYmIdQa0qFKwuety67toEnOLBCFD8ZdHHA
         Py4jsMsW7Dqi7DJLvhPgOaAfbEksUOqlw2sCAgzSac852Mt888jxrXQwMe5dtjXA1uCz
         VA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cqd+nHAtyHPX1TFwEse8byzK8ys5i5RMjcpqTUGLpbY=;
        b=5CEIM/WjS91hp/MgakJ1yoAagpuKiThCQ+kQHvjyQLMa6EiMnqkllXWWk11Edli85h
         cKFLPtyH3DCtKvTKRzDwiuN5oHnvDg8XlUIvGYjcV6Fg8h0Ju9fev9wees9qbpYg5MUE
         HZUZ2rHtRO0ZujXiw6eARWvEqtrFlmNGLjP9sjpfFRm5gy8ZCyyGgq+Zk6l4RvcmppyN
         xJpGVTni2cgZDlJs727FKpjHvax4APVLGXERbLDpBGFWHfG68lnv/G0XqU3ojdD6Zmsf
         iUMkR58o211gUiENX3Kaey6EWq66zmYXJl3teuFmHmfETTIYXtbgh8mDbQ7BlpHbjo2c
         NiWQ==
X-Gm-Message-State: AOAM532lD6K/Bct/o/MWCmEj/13naoqJh1D86waFq931Zo1KccxoyP2T
	bWN5THrN6JVnSLSgTWwbGfU=
X-Google-Smtp-Source: ABdhPJw6GGKIy6Xla66jzDmfg+MfJVxsugVCLGL94ScZSCChCbM/0W0cOwAyiwMYiLv6ofnO+/QFcw==
X-Received: by 2002:a17:907:d01:: with SMTP id gn1mr5853708ejc.507.1644488190439;
        Thu, 10 Feb 2022 02:16:30 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id i9sm7994855eda.35.2022.02.10.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 02:16:30 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/2] staging: r8188eu: clean up ieee80211.h
Date: Thu, 10 Feb 2022 11:16:21 +0100
Message-Id: <20220210101623.13758-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes unused structs and enums from the ieee80211.h header.

v2:
Fixed a typo in the commit message of patch 1/2.
strutures -> structures

Michael Straube (2):
  staging: r8188eu: remove unused structs from ieee80211.h
  staging: r8188eu: remove unused enums from ieee80211.h

 drivers/staging/r8188eu/include/ieee80211.h | 266 --------------------
 1 file changed, 266 deletions(-)

-- 
2.35.1

