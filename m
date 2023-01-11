Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2908A92A
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 19:56:56 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFhDO-0005F2-Qo; Wed, 11 Jan 2023 20:56:50 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/20] staging: r8188eu: io cleanup
Date: Wed, 11 Jan 2023 20:56:20 +0100
Message-Id: <20230111195640.306748-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up structs and function prototypes related to hardware access.

There's a number of definitions which are not used for usb devices such as
the r8188eu.

As usual, this is based on all the previous patches I sent. (I promise to
send no more patches until the pending ones are merged ;-)

Martin Kaiser (20):
  staging: r8188eu: remove struct io_priv
  staging: r8188eu: remove io function prototypes
  staging: r8188eu: remove ioreq function prototypes
  staging: r8188eu: remove async read function prototypes
  staging: r8188eu: remove async write function prototypes
  staging: r8188eu: remove struct io_queue
  staging: r8188eu: remove attrib function prototypes
  staging: r8188eu: remove rtw_write_scsi function prototype
  staging: r8188eu: remove dev_power_down function prototype
  staging: r8188eu: remove struct reg_protocol_rd
  staging: r8188eu: remove struct reg_protocol_wt
  staging: r8188eu: remove interface handler prototypes
  staging: r8188eu: remove readmem and writemem prototypes
  staging: r8188eu: remove IO defines
  staging: r8188eu: remove struct io_req
  staging: r8188eu: remove usb buffer macros
  staging: r8188eu: pass struct adapter to usb_read
  staging: r8188eu: pass struct adapter to usb_write
  staging: r8188eu: remove struct intf_hdl
  staging: r8188eu: remove struct intf_priv

 drivers/staging/r8188eu/hal/usb_ops_linux.c  |  34 +--
 drivers/staging/r8188eu/include/drv_types.h  |   1 -
 drivers/staging/r8188eu/include/osdep_intf.h |  32 ---
 drivers/staging/r8188eu/include/rtw_io.h     | 255 -------------------
 drivers/staging/r8188eu/os_dep/usb_intf.c    |   9 -
 5 files changed, 9 insertions(+), 322 deletions(-)

-- 
2.30.2

