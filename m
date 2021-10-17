Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7429CA
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:20:42 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id pf6-20020a17090b1d8600b0019fa884ab85so12817366pjb.5
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fz5biioEaxzmk90taTLWjwha9QBsnc0Q/9w21LeSWAE=;
        b=hJxU/L547sPEH/X/RobaV/wHpXuK6xEPJbf7C952RQF+0G3+aZGMjLXQrEyAlJRHz5
         efKgOz6W2DcU8KwYjWkOGAYAfB8lM2eeYvy0XzOqdksnMG/5WGNKhDfYJdaOiVre+B2i
         s41ugn10WUKl1rMcIRctpuzAlEVuTEcSHZZahsw9vx78OKSJ9Rbl10VV1uYrDe158UzO
         IHf8ecJgOHok8Wols2GCl3Uic30XXZYj384/qf59z666YzcugPx3DJK2mc6nRnBPwc5Q
         HPy4q5yviaH9weqhiJ9sn3ryq2wTAFi6Q3rPWY8RULlTQAzuwjN1hpFrGVAKlwmSLqOH
         HYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fz5biioEaxzmk90taTLWjwha9QBsnc0Q/9w21LeSWAE=;
        b=UpHEpga9XiwMRFqX8ED0OrvS/wGv9BEiaxDIGwVY1cvlPKAqJdXtDpKCWEehNPKAnz
         qn4asCkHyv0pXkyFVd/tzEyWlkavdtWhJHNpWi3vbR0PQJV+cFZIyyrfJDhBfxn3qZui
         hrfzSxUW/7jEy+LX/vW81PzdxDtljUF5xU4ZCE3WBSQaAkHCuOCDkIJHsY/ofnFBuxCs
         ksSIJNTP4JFD9oTuWxOLUq4xiSTfwQ1OGKg5GDV0uyqdwLmKRLPzPQJxrXHJVJcLAhO6
         1BJL506rF3zsDll/RI33ncUoQSWkID/asgTiIpX71d95IgAx3qGN6Ys4vnRF8Fk3W/k5
         2w7Q==
X-Gm-Message-State: AOAM531lXynCduki/e79YwDAjrUPa4B/mYchxBKiMmGvfhT9KB4G26Ga
	i23fDfTEFvD2WFe86hjB/fo=
X-Google-Smtp-Source: ABdhPJx9lwgRB5C7qGwjCZD0ZzWyNeQSAmyDLzITbIPVHi8EYqmOeTn0ymaevjL/FaAj+BXT0Q5I5Q==
X-Received: by 2002:a17:902:758b:b0:13e:8b1:e49f with SMTP id j11-20020a170902758b00b0013e08b1e49fmr22353467pll.6.1634487641749;
        Sun, 17 Oct 2021 09:20:41 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:20:41 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Alan <alan@linux.intel.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/17] media: atomisp: pci: add missing media_device_cleanup() in atomisp_unregister_entities()
Date: Mon, 18 Oct 2021 01:19:41 +0900
Message-Id: <20211017161958.44351-2-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the commit 9832e155f1ed ("[media] media-device: split media
initialization and registration"), calling media_device_cleanup()
is needed it seems. However, currently it is missing for the module
unload path.

Note that for the probe failure path, it is already added in
atomisp_register_entities().

This patch adds the missing call of media_device_cleanup() in
atomisp_unregister_entities().

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 1e324f1f656e..0511c454e769 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1182,6 +1182,7 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 
 	v4l2_device_unregister(&isp->v4l2_dev);
 	media_device_unregister(&isp->media_dev);
+	media_device_cleanup(&isp->media_dev);
 }
 
 static int atomisp_register_entities(struct atomisp_device *isp)
-- 
2.33.1

