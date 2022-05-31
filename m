Received: from p-impout004.msg.pkvw.co.charter.net (p-impout004aa.msg.pkvw.co.charter.net [47.43.26.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977B17C9
	for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 01:33:08 +0000 (UTC)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com.com ([24.31.246.181])
	by cmsmtp with ESMTP
	id vqjLnnv0kgPEBvqjLnJB3d; Tue, 31 May 2022 01:31:32 +0000
X-Authority-Analysis: v=2.4 cv=b8OhX/Kx c=1 sm=1 tr=0 ts=62956ff4
 a=cAe/7qmlxnd6JlJqP68I9A==:117 a=cAe/7qmlxnd6JlJqP68I9A==:17
 a=IkcTkHD0fZMA:10 a=yQdBAQUQAAAA:8 a=OUNqcoRDPagEZD6Yk-wA:9 a=QEXdDO2ut3YA:10
 a=SzazLyfi1tnkUD6oumHU:22
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v3 0/2] Fix some compile warnings in v5.18+
Date: Mon, 30 May 2022 20:31:01 -0500
Message-Id: <20220531013103.2175-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGbqQDfKRfN/DY4TcrnBF/T0igbGbmWXTdWlcK5i+w/T4imgw4mbswxqD3jVKF/NsUEYdYTlBcEIOE/ST5vG9nsW3qTxW2Ez6yBCmgHRMzMEyX9cApHh
 wuv3AZfkVgguegnhWlcHQlmqd1vnd5uCGw0dI3hqqmeazAKibYK/U8587hD8OVWLR2YAccGvnZdHf9NK2qtSjxL7LYwyc5ApwjttjJucx3k6c697CPSwkgeo
 7+jRaCAc+bkJC+Kz/sFcwlrhnYx7yy4G3lYeDAm+7JAtdUL5Ur9WwDo8sEAhI4SNNrP/hy5rIIBV1DiAQOfDByqe8COBrcDheSTAEpaB5UgWsWc5rm8afUaK
 hPOGuuNEhNXjlYde3rBZUkdLLy1MtaYvKUqVkRd5GDnMBLbDb56/Zn/tl104/PaWdHXhIKwtvLHQGtLrtaCgaZiIQtENuTyRcqcq+oYfRd+OHrJnvE4=

Building driver r8188eu in staging with -warray-bounds exposes two places
where arrays are too small.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
v2 - get proper To and Cc
v3 - Use Dan Carpenter's suggestion for correct patch.

Larry Finger (2):
  staging: r8188eu: Fix undersized array in rtw_xmit.c
  staging: r8188eu: Fix warning of array overflow in ioctl_linux.c

 drivers/staging/r8188eu/core/rtw_xmit.c      | 17 ++++-------------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  2 +-
 2 files changed, 5 insertions(+), 14 deletions(-)

-- 
2.36.1

