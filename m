Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18D629CA
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 12:32:25 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1405640255
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632918401;
	bh=iH/cPXldDgnABS8nEn4aJPP/G7VcHOpg5XHI2afeaZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=VEKG1nbo7OlTcPK1Pxtq8HjW9RaUlo1HALJ+JxR9nbMiaBDy5zQFDW1k2Aq1xI7p0
	 zBeabpCzq1rJ49udDW+VlJ75mdKzl4tpFg/roCaB8FGvdDGTzl5OXr8qoounBVTqjw
	 bkYJJMxa7hI8zUcdV60aMUB1RQaNiCrmFEvhIPOl+BApUwus8eHWASbYyb7OZqt8j+
	 u/UU/XtEt5KgEd7D/jXf7fdOYc9tLiH5s5C4le70WVx/Lb6kA9d1wFryo3OqNdk7Sp
	 yPj3eqprso79d6PN9zECEdkPBRyx7MzIW37JHb61wMkZ/yJThO2LXz0YheURA9cnaj
	 Lu0DAAHDDqY8w==
Received: by mail-ed1-f72.google.com with SMTP id ec14-20020a0564020d4e00b003cf5630c190so2263872edb.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 05:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iH/cPXldDgnABS8nEn4aJPP/G7VcHOpg5XHI2afeaZ4=;
        b=fRW3S144raR816cO9MUi/g/AMIemEL0hGKSSD56RCgiUFtLZMPJHwdeCkV0Cz/vRda
         M+bJ2zJ1BFulivkk5pSU1hfK+hMitLTYCCKl660eCiQUYGbBHp0VtOjGwe2ZQIsn7CqI
         Uh4XCCGd3qGYpIqp+rvIcQZ6xHL96cou4RuFPC1Tx2JUe5iFV96PJOzUVk3gjPOg4FR5
         2pF9XWSYqP/j58EwQZh559Ds1FG8dxBq5+AHN9Umu/E5YKn+T/0JkSxc6dp/RsMwPESS
         1xSX2WXgWXKaeL7SVw1endJmRJJExyTBAtR6/ug+GVLhdtNoUOtKu40WiaVVvIhgP3yI
         VgrQ==
X-Gm-Message-State: AOAM530jFqtr0h6rqxj34yboZApPpQFoTKXtZjHdJQcnOl2Xd1+osRDX
	PhtOKDncf0d+qXbOnGrl61nTqYFU7tF9S9GdPkquhzstkLBc2Uq2C/hIzjqHj+TEa6SlKriya/6
	ACwYDT60/e4O8omIxfZzVDm0guf0LpNW/lXIuVl0T2wI=
X-Received: by 2002:a17:906:3012:: with SMTP id 18mr14286935ejz.136.1632918400409;
        Wed, 29 Sep 2021 05:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzic6knnSwMhuoN2x1g6dBpy/Loh23z6fNTkl6oz7ai61L9d1KUxkiRLK88oLwsTMQgB0XUg==
X-Received: by 2002:a17:906:3012:: with SMTP id 18mr14286914ejz.136.1632918400184;
        Wed, 29 Sep 2021 05:26:40 -0700 (PDT)
Received: from canonical.com (net-188-153-155-161.cust.vodafonedsl.it. [188.153.155.161])
        by smtp.gmail.com with ESMTPSA id w26sm1415972edu.59.2021.09.29.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 05:26:39 -0700 (PDT)
From: Paolo Pisati <paolo.pisati@canonical.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: add missing return type (fix -Werror=return-type)
Date: Wed, 29 Sep 2021 14:26:38 +0200
Message-Id: <20210929122638.58623-1-paolo.pisati@canonical.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
 1649 | }
      | ^
cc1: some warnings being treated as errors

Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..f36dadb5230a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1646,6 +1646,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+
+	return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 }
 
 // Test flags and set structure.
-- 
2.30.2

