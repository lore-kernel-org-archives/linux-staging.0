Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCEB7C;
	Tue,  1 Nov 2022 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667310454; bh=7jTJtPDuvOB4UjP4GvxdQueh87xLMlDPi/Mqzt+n5G0=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=lB6xDl1sDGjv3GtGZQBgw60sAB+cuWMDNzmltKRksha1WAHF093y9HHlC3NztsyI8
	 U1Sbzo3ifHEbQFbYKKXghpysTsT4IueFFvZnenmfmzAzLNhFbiMyBkFOnmsR9rQRts
	 P/KhuZQZs46rIqZh8r1CF8Mm0T3FEhinXa8U3ryo=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Tue,  1 Nov 2022 14:47:34 +0100 (CET)
X-EA-Auth: DfQ3DHXejnins+N2KjtND5TsIgSXGYhJ7du0CuWJRoHUgib7V4P3WtP15n7USff9UsVtKlni9XmdVpw0oYMVDJ+tGLC47Zf+
Date: Tue, 1 Nov 2022 19:17:30 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] wlan-ng: Unused code clean-up patch set
Message-ID: <cover.1667308828.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The patch set proposes to clean unused code from the wlan-ng driver. The patches
are compile tested on my x86 machine.

Change in v2:
   1. Review and include additional code clean-up opportunities as
      suggested by dan.carpenter@oracle.com and paskripkin@gmail.com
   2. Combine changes for different impact areas into a path sea.
      Suggested by dan.carpenter@oracle.com

Deepak R Varma (7):
  staging: wlan-ng: Remove unused struct wlan_ie_ssid references
  staging: wlan-ng: Remove unused struct wlan_ie_supp_rates references
  staging: wlan-ng: Remove unused struct wlan_ie_tim references
  staging: wlan-ng: Remove unused struct wlan_ie_ibss_parms references
  staging: wlan-ng: Remove unused struct p80211macarray definition
  staging: wlan-ng: Remove unused function declarations
  staging: wlan-ng: Remove unused structure definitions

 drivers/staging/wlan-ng/p80211mgmt.h  | 301 --------------------------
 drivers/staging/wlan-ng/p80211types.h |   6 -
 2 files changed, 307 deletions(-)

--
2.34.1



