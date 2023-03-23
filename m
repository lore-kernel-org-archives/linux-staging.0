Received: from mr85p00im-hyfv06021301.me.com (mr85p00im-hyfv06021301.me.com [17.58.23.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C0FC959
	for <linux-staging@lists.linux.dev>; Thu, 23 Mar 2023 19:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alexanderheinrich.de; s=sig1; t=1679600826;
	bh=7e0mOMN+132oHU+oNdWs1w73kAqAlevdhDkJ5lU1/Pw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=KDWi0CCHh9d7mOnl43q31N5WP/N5POICIAqwSI+GEiyefghvOphVR+O/tYHCmPXpV
	 sqMh2MzegZJLgzRqFF8aj0a5rBUzXZew9aR90zDvhU4S8JAHsljs1FFl+OfJTLO8a9
	 vtA9EVydVm781CVdRvP5aaYk9ZbQn6DKfK6ao3bGnpkgxLN5h6lhIjd7L0YmjQMBzi
	 zLYwbd/HeQwDnJlseQ9hYFKCgkbxfpIHBFTZ52JRYNuHgdc7Bafm6eB36QEDC45sru
	 3mUk1lKNtvm3IjA7bo+DNTPpYi6lsUD2XomqiQKJmKrygyGE05vFvzpgYGFg9senyB
	 PBwFaoaKKzXtw==
Received: from pop-os.fritz.box (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-hyfv06021301.me.com (Postfix) with ESMTPSA id B57E82153827;
	Thu, 23 Mar 2023 19:47:02 +0000 (UTC)
From: Alexander Heinrich <hallo@alexanderheinrich.de>
To: gregkh@linuxfoundation.org
Cc: Alexander Heinrich <hallo@alexanderheinrich.de>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] Correct code style according to Linux guildelines
Date: Thu, 23 Mar 2023 20:46:11 +0100
Message-Id: <20230323194611.299241-1-hallo@alexanderheinrich.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NMQqH20QdwvPuCQG3lM-3DrPAx2TFCu6
X-Proofpoint-ORIG-GUID: NMQqH20QdwvPuCQG3lM-3DrPAx2TFCu6
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1030 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=753
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2303230144

This patch fixes the following warning produced by checkpatch.pl,
when run on drivers/staging/wlan-ng/p80211req.c.

CHECK: Unnecessary parentheses around
    'msg->msgcode != DIDMSG_DOT11REQ_MIBGET'
Signed-off-by: Alexander Heinrich <hallo@alexanderheinrich.de>
---
 drivers/staging/wlan-ng/p80211req.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/p80211req.c b/drivers/staging/wlan-ng/p80211req.c
index 809cf3d480e9..df2d07304d1c 100644
--- a/drivers/staging/wlan-ng/p80211req.c
+++ b/drivers/staging/wlan-ng/p80211req.c
@@ -125,7 +125,7 @@ int p80211req_dorequest(struct wlandevice *wlandev, u8 *msgbuf)
 
 	/* Check Permissions */
 	if (!capable(CAP_NET_ADMIN) &&
-	    (msg->msgcode != DIDMSG_DOT11REQ_MIBGET)) {
+	    msg->msgcode != DIDMSG_DOT11REQ_MIBGET) {
 		netdev_err(wlandev->netdev,
 			   "%s: only dot11req_mibget allowed for non-root.\n",
 			   wlandev->name);
-- 
2.34.1

