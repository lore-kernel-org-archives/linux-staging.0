Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2C1625
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 09:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1666518047; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dGjwKzMimMzK7xsqKCxWSi9DIaURzFZk5p5dSdNzz7Po3LvTvcAYqFcxkaxCqbEU+VeEQ4ckTdhyDxV9R08xRX6FZ6qJmueSyRWX+749YvF2CmYsbZcrP+tjhWSzn7wc6X093Ueenp2MA3ksor2RP50PNo2aAn+aM/L0tKaTeFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1666518047; h=Content-Type:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=1Far/HHjb++ilNLR8nhNCNUd/ZBTwZW+m+N2jmHuo9M=; 
	b=R5Sbts/7YoMdBlMLhLTIG8connTyEnC5IdEQ+S0cflkn/HlEC9fLaEoW9YHpC1L854FuI0HiIZwJeifce0KSsjEGuxh2yoX4Hpd9aVxCl7xi/D8ejWoILE4oOzuhi7PumS4x7jWaQGlC0HIEOhRLy0iCSlGuJTDi4QGmAbFoYK8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=t4rmin@zohomail.com;
	dmarc=pass header.from=<t4rmin@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666518047;
	s=zm2022; d=zohomail.com; i=t4rmin@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To;
	bh=1Far/HHjb++ilNLR8nhNCNUd/ZBTwZW+m+N2jmHuo9M=;
	b=W/787IvuLHV9l006/1amIia+xEGuPvUr7VQVRx5vT65QhtiwJpS3TAtS9j1nTq3v
	62kSZOv6yyyqJCa5n9EWaXgHhKOufQKom8pVPh7P6Mg5gaf5wHunJFIhTDm+hNNH0W9
	6QgfQ34IQiuVZ681IrMOVcBHh4W82Pi6wQGHpcQw=
Received: from plymouth (101.128.127.165 [101.128.127.165]) by mx.zohomail.com
	with SMTPS id 1666518045221279.8220034711304; Sun, 23 Oct 2022 02:40:45 -0700 (PDT)
Date: Sun, 23 Oct 2022 16:40:16 +0700
From: Aaron Lawrence <t4rmin@zohomail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: rtl8192e: rtl819x_HTProc: code cleanup
 patches on the rtl8192x_HTProc.c file.
Message-ID: <cover.1666502177.git.t4rmin@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ZohoMailClient: External

Multiple patches regarding the cleanup of code in the rtl819x_HTProc.c
file according to the checkpatch script aside from the CamelCase issues.

Fixed patchset email format in v2.

Aaron Lawrence (3):
  Staging: rtl8192e: rtl819x_HTProc: fixed missing blank space
  Staging: rtl8192e: rtl819x_HTProc: fixed alignment matching open
    parenthesis
  Staging: rtl8192e: rtl819x_HTProc: fixed unnecessary parentheses

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 38 ++++++++++++-----------
 1 file changed, 20 insertions(+), 18 deletions(-)

-- 
2.38.1

