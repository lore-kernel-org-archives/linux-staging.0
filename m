Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1A1C03
	for <linux-staging@lists.linux.dev>; Fri,  5 Aug 2022 16:28:06 +0000 (UTC)
Received: from [192.168.192.146] (port=57874 helo=nx64de-df6d00)
	by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <gszymaszek@short.pl>)
	id 1oK0Ad-0007pN-HF; Fri, 05 Aug 2022 18:27:33 +0200
Date: Fri, 5 Aug 2022 18:27:30 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg KH <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Grzegorz Szymaszek <gszymaszek@short.pl>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 0/4] staging: r8188eu: cleanup some metadata issues
Message-ID: <cover.1659715931.git.gszymaszek@short.pl>
Mail-Followup-To: Grzegorz Szymaszek <gszymaszek@short.pl>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg KH <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset tries to improve the r8188eu driver metadata. Some
hardcoded values are replaced with proper macros, some unnecessary
macros are removed.

Changes for v2:
- added a cover letter and a base tree reference;
- added Philipp Hortmann's Tested-by;
- replaced the second and the third patch with different ones, per Greg
  Kroah-Hartman's suggestions to make better use of existing kernel
  macros and remove unnecessary ones.

Grzegorz Szymaszek (4):
  staging: r8188eu: set firmware path in a macro
  staging: r8188eu: use KBUILD_MODNAME instead of a string constant
  staging: r8188eu: drop the DRV_NAME macro
  staging: r8188eu: drop the DRIVERVERSION macro

 drivers/staging/r8188eu/core/rtw_fw.c       | 2 +-
 drivers/staging/r8188eu/include/drv_types.h | 4 +---
 drivers/staging/r8188eu/os_dep/os_intfs.c   | 3 +--
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)


base-commit: 9de1f9c8ca5100a02a2e271bdbde36202e251b4b
prerequisite-patch-id: 79964bd0bcd260f1df53830a81e009c34993ee6f
-- 
2.35.1
