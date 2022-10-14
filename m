Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789B7B
	for <linux-staging@lists.linux.dev>; Fri, 14 Oct 2022 08:19:46 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=momi.ca; s=key1;
	t=1665735583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S+qVVqu5oKqaCALiw/URmOVikhCImWYfEp52IRag7j4=;
	b=qBynZYdiFQ6FweZcz6BIC/LCRGjDIdVVPeem/a6JY6m8/MJCH2iWH676EYdb5eGX4Wpu7z
	/173g3NWHALAJr4OOeHE3u6Hx6H2vBk4OQWKqLGqQGQ1tqCUDJ/5BnsQ5lNr276ABcxkH5
	yDg+24YD2bL+dtC7UOfios1Sznk9SP2z6uAnk/NTe9EPQFXa/6uyD5viVlQ7PDvOLw4z3P
	xzzipwOjjIPfKvCazVm0/GCDNBN9fxx8ZfTGyJ0xKTkfEoozttO/zfeLRbIPVmOODPK/ij
	xoOPUc9YbNL0h6uhZ8/nPFteGckv705s3hta1PIERMax8O+X1/RnXAWVqJ/9VA==
From: Anjandev Momi <anjan@momi.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Anjandev Momi <anjan@momi.ca>
Subject: [PATCH 0/4 v3] Staging: rtl8192e: fix coding style issues
Date: Fri, 14 Oct 2022 01:18:36 -0700
Message-Id: <20221014081839.23902-1-anjan@momi.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patch series fixes various checkpatch.pl issues: removes unnecessary
parentheses, removes multiple blank lines, aligns multiple line
function calls
to open paranthesis, and adds a blank line after function declaration.

Anjandev Momi (4):
  Staging: rtl8192e: remove unnecessary parentheses
  Staging: rtl8192e: remove multiple blank lines
  Staging: rtl8192e: make alignment match open parenthesis
  Staging: rtl8192e: add blank line after function declaration

---

v2: add one patch for each style fix
v3: list below the --- line any changes from the previous version

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.36.2

