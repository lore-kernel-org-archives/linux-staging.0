Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60409173
	for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 10:08:50 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id c2so16968231wml.1
        for <linux-staging@lists.linux.dev>; Fri, 21 Jan 2022 02:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y8ZgvxUuDvMPASUzYnlUG7u5a3DpOlNEJdmY/247HGY=;
        b=etPcju/1MxRY9JATTvg5CBIibQQNKGie7+8hppQ5Pyn/r8X1gijuohtVwQ5re5lMzg
         yNKMnkXDvxoGdovk0PdhO4iRGCR65menQCQzIIplj53mwge2wt+FfGG19jtppiqm95zo
         96m+D9dYkVb/3Cq18kTeyEbm1Nxa0Qg77K3Xt2nOdTSR65CfMdDmewDmwtVp8IrAkfzh
         BsWoXNtCRNY2Co8EKL4EZmg2wyfjZwT5eHalncKpGPQwUUsyl9VaNId12zJRclP0EQPO
         J4oijuM3KVSAZyfymoTDKmzmZgKEl86F7tQ0Gx00iJPMMfV99ciNDiDDKzIkE0LHRcQT
         yFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8ZgvxUuDvMPASUzYnlUG7u5a3DpOlNEJdmY/247HGY=;
        b=MHUxFHtE8vWHUach4Km8CqEQkm913IHhvInE5wz+2VZYg3d0D2sVyZQsgowSRQB11N
         gsKt+CNf34KTmFwKHk5ZwtrQ+Y3CKQwhPDWqD4afV+7sFfXRQuGQ2VVeWDb9OnDJP4VS
         TpmGZMFTtvaHnzpy+rUsOeK+L5fvcC5IH5e0YnXCVFyxmcalZ+SGMjvqxDNEjnwApTsZ
         Bc9GzWrrLAnnp84FjOyywm/3RJDls6nohXFHMewmaBUDd2XILwYAPekcUBDiz6IXm5dQ
         owbb4qv2urrL/SNFa3I8GcRJjVu1tkwwCSD2zoz4mXB2dfBJwdXkYdzrMBVo8mlYfc7o
         J4Ww==
X-Gm-Message-State: AOAM5308p068d7SgXeFIa1jtG/XdRBXuP+6te638dQA8zhLyTOOg+5sb
	ke2BBiUMBScjseZlS23EYWo=
X-Google-Smtp-Source: ABdhPJx3H+tWPTkTeobp58QCfJQQ/MlwUv4k/fR0+l7o32+dB8T/PCDWmOptrxRisxLWHq6aKFpjuA==
X-Received: by 2002:adf:e3c5:: with SMTP id k5mr3071914wrm.571.1642759728794;
        Fri, 21 Jan 2022 02:08:48 -0800 (PST)
Received: from localhost.localdomain ([141.72.243.13])
        by smtp.gmail.com with ESMTPSA id g7sm5479526wmq.28.2022.01.21.02.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 02:08:48 -0800 (PST)
From: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
To: mosescb.dev@gmail.com
Cc: gregkh@linuxfoundation.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH] drivers: staging: media: omap4iss: Use BIT macro instead of left shifting
Date: Fri, 21 Jan 2022 11:08:36 +0100
Message-Id: <20220121100837.337094-1-mosescb.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121093722.320082-1-mosescb.dev@gmail.com>
References: <20220121093722.320082-1-mosescb.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
Dan,
Sorry, I missed it.

Use BIT(0) instead of 1

Best,
Moses


