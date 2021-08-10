Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1922FBF
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:50:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q11so353234wrr.9
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 16:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s+bMuS4HbgN+glrMlQoSd0LVvTGOtjG5gRbIUrhqhfo=;
        b=KcQsg6MBeDXHJtvOGXl0M+cHo2Wn35FjWDjLr0pknPf6TcX92rbT9UC3aW+YNcojas
         /S5ilm+c8n0X4keJfm2aOiYrjVIOYgQfsaEX9dtTjVhYQLaRC31tuVaei6Lhp9dohLip
         SoI9lUEk/a++Tk3d/L9oAXy6CMqNjUEVfY7cl2t6iwdkGJLEHn5YVYh6VGHwoMG4IzHZ
         q2pPgSW95zzfBzLMnxDS4qrr6yHPYTRMNICJXLhM26TLQzHWVFkzor0YCIegVwvqWW9p
         ObohON9pjcl4HkxlLrHUGFyXnarO9GassizWZ7o/QNj0iYPBErYbqQ6rFkMr/dA5fWkl
         gyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+bMuS4HbgN+glrMlQoSd0LVvTGOtjG5gRbIUrhqhfo=;
        b=IjAoVbVfp2R15nO24NRoEAGwo/JS6XGaGgVaVCwzfPdigo9JLKWIeWy3gk7jLv1E4U
         sEdyJMJPxCcevLtEw5KofmCg++ilRAkWamrQ+U3cG4fLeq/i5BMZYxWCQpkYvR4sOqoK
         uA+ENZ15BZ51rD6Xre7e6ig8fnL0y5TIFSxayNlx8hPnH+4XwdPFmOjX1mBx43BjDtDT
         YURW5ETbdHrz4SRx+F17qSCeFUaZZnBn63tALSf7O8jgRXRc508YLjt1L2vCuiQkZPDH
         DgXZkYMMtJiROhsQoq+WETzIMuv4SoNS3OqKYwn36jJ+zkRWVy6Qg6iHh6hKxYtQTQPu
         FQIg==
X-Gm-Message-State: AOAM530UNwF51wx7OtKIEj7pBiVbvFsOHS/cp6nVY9um+hqMjW/8acb4
	bjdAZq5Bt+JbfSkh+WRAEvm9EQ==
X-Google-Smtp-Source: ABdhPJxVslqn6dltSqdxLcrvBvTFItD0DXs7WgjMTCXszRyG/1WlSp2MXZYsdmpw5KmAWDoAdDcsgg==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr12173137wrv.83.1628639451336;
        Tue, 10 Aug 2021 16:50:51 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id p14sm13881220wro.3.2021.08.10.16.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:50:50 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] staging: r8188eu: remove unused label from recv_indicatepkt_reorder
Date: Wed, 11 Aug 2021 00:50:42 +0100
Message-Id: <20210810235047.177883-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810235047.177883-1-phil@philpotter.co.uk>
References: <20210810235047.177883-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused goto label from recv_indicatepkt_reorder function in
core/rtw_recv.c

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 08aea680312c..f0a042467386 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1801,8 +1801,6 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, struct recv_frame
 		_cancel_timer_ex(&preorder_ctrl->reordering_ctrl_timer);
 	}
 
-_success_exit:
-
 	return _SUCCESS;
 
 _err_exit:
-- 
2.31.1

