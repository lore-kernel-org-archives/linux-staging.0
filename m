Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383982C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:25:03 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so12828043pjc.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=va1wOEK7prq0g6xbMM0ouEtB510a8wuP54vz2v0aIcY=;
        b=GcLww3LN2g8DJDDSHxZm7EUvgM99s3wD5LI+OpFaDduYIS7FQuENACFR/JWHyduY1W
         HHbFm4kQRYm0hYGCnccoMoVroZFbGjBMwS2Vh7MtEOyinyjwqhNtqgqs7eF/QVT8pYeR
         gq9UGBjhFMZ6eECqIzaNzLdXKRGOhwCk+w6gTJA6CrMhj1M7Ta0KAqQvQv0FSA9b7tVG
         hpf6bwTLOox2Mh88rJsl2vj6me9HCOMp8BAyzOZ+qYVdPGsyogvFaFsTp5N/lFTFCZLi
         c6mh8MYxG185HiaqxlhgXCI97ZTo40XSacdHoSWQtXzXon2WTw00MVBJ8OiSn6X0o3aR
         xnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=va1wOEK7prq0g6xbMM0ouEtB510a8wuP54vz2v0aIcY=;
        b=xU4Vn0Ot2sG3vq6bVrp1rnKAqlsGNSpuAhwHozfvSWLXcz/m7OHiRcFyJ8wcDeI0F5
         64S2mb8mJI85a7iPvRiTqZqQZgLTcbve+XLhikcN/5df0+ukNaJ7kSFS3x3Dmyv0f5pl
         Asc7538AahvnWIxaIsO42pzj3i1QkbAGsCJLlXY727bPZzq5R8dP78v9YJK9xuLllaxn
         Xmk62ljxnqWdvlcbVj+pyf1Brbo1JN/vBEjrue6/SnSgHmrRvfbk546nPYL315zZdzmT
         pTWhmK4DFcj4hHBXJJ/mTrN7LS7R65/bSltRaVQer/C4N2LHvsWak5FoerW6rpHbCGgB
         b+Uw==
X-Gm-Message-State: AOAM530xOcwc8IwEiW6iu2rtvL1zPMKfhOarCvaZrtYKryznlmVoDDj6
	CAAqC176PFhv3yfDgJKq4Tg=
X-Google-Smtp-Source: ABdhPJwrgPLl1nNNQaWQMXtYN4uy23b/Hi1FG6PMsJgEmMSwZ6zbKOqr+ApFspjeujU5Ii3v0lU/HA==
X-Received: by 2002:a17:90b:3588:: with SMTP id mm8mr42281447pjb.238.1634487902794;
        Sun, 17 Oct 2021 09:25:02 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id f30sm10814332pfq.142.2021.10.17.09.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:25:02 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Kaixu Xia <kaixuxia@tencent.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to stop working on Microsoft Surface 3
Date: Mon, 18 Oct 2021 01:23:36 +0900
Message-Id: <20211017162337.44860-6-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017162337.44860-1-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Touchscreen input works fine before loading atomisp driver on Surface 3.

However, after loading atomisp driver, touchscreen works only when
capturing images. This sounds like atomisp turns off something needed
for touchscreen when atomisp is idle.

There is no useful kernel log. Just the touchscreen stops working
with no log.

I'll update if I find something further. First of all, can someone
reproduce this issue on the other devices?
-- 
2.33.1

