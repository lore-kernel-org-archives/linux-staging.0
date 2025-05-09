Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50702261399
	for <linux-staging@lists.linux.dev>; Fri,  9 May 2025 22:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828729; cv=none; b=EoLJZvHSCKbNFTzgo/eABc5vMMKXIsTvLyi6aoWWTvA5K7OzC0dXnyxnNcK3DkarRUd/+riNLW/VXoRNiUO144wHGGv5zRp9HxoCAIDjfleND1h92xswvz6KJt7d1m+iJAOgRktFtejmwKGMEZkx5cyFpip7A7dwOUSWQRY0A0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828729; c=relaxed/simple;
	bh=BnBZRz4dT1Lk6L/ypSwjnCDxiW8osgAAl4CJT5AS+hI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q1xHNZ/dyclKo+PbPkPiezl4tgqtZX7zeM18hMtZlvv8bC43gt2KJWrQG/plp7KYMsEzpmdYxsP+xu+sKDJH3W8K0wnr/AJrgXBm3i0Y13fDJl431p59pbFaie+oO8efEO/Z7nts2nIKPEjVxZPl0E3c9eeG3tIYeT1D8ySR480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JMjq09Xq; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JMjq09Xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746828724; x=1747433524; i=wahrenst@gmx.net;
	bh=UnckWju8lqyJaXWWBvr6+4fcyqgUDnUnHX34/f1XfVs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JMjq09XqdxU1CY5bkH5y8wVyaawiJy68fwzBav7T4CHWHIlMj8V/bPZwuv1S9sXy
	 6tUOVfuuT9HkoEiypWo/b9hNApjz4RZ2ndVFKV94VgXcSKkrSOqqHHn+DUlv4+l1F
	 oQfeDIh6ww2skcDM6xeakv1o5mMbAMnAB8Syj7P4tKN75xNhq0UbQt3m+H7J/uYpj
	 LHWwbttZn53uuwMcFWPnpsP90ABig1MGSGr2+qbDIAqhZjrbT+QxZi0TIG/CQehO9
	 V/zC8flRIx0wkIbvaK7kedpjActU+mDYMtRFYdcKttTCHi+H8kyk/KUzBVjjtA0j7
	 Mkd7noW3NFTPqA0Ykw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS9C-1usrEs0LcY-00ZooD; Sat, 10
 May 2025 00:12:04 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character device
Date: Sat, 10 May 2025 00:11:52 +0200
Message-Id: <20250509221152.13564-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509221152.13564-1-wahrenst@gmx.net>
References: <20250509221152.13564-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P1fnhqreWx9tKc758g10vhemCqoJtXEMpVVDL44RYpT2uRrNrTX
 aFK6nx+Nx6xCUj7RFcTQNzvdWCqO6L+7xE8MHKciasSjmhU/f9A5XR7dTpvQBCiI9CWnNTf
 wdiaOjUGgV8rwbWaXWIJfNvOVosqB5Sf4rySwLCHowHtrjv9ckLkeJ42NRUpjZ8YLToE2AH
 b8sWDtzm5lNt3F5etNJXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fati7DfFS6Q=;4gJ9Ipqqgci+YkawL8edP6pgTVe
 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
 k8/5qmIlV+tGB5Hm

From: Phil Elwell <phil@raspberrypi.com>

Document the IOCTLs for the VCHIQ character device, which provide
a userspace interface to access the VideoCore VPU of the
Raspberry Pi. Several ARM side libraries make use of it like EGL,
MMAL and OpenMAX.

Link: https://github.com/raspberrypi/linux/pull/6801
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
[wahrenst@gmx.net: Rewrite commit log]
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-cdev

diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/driv=
ers/staging/vc04_services/Documentation/vchiq-cdev
new file mode 100644
index 000000000000..99ab2567643e
=2D-- /dev/null
+++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
@@ -0,0 +1,87 @@
+What:		/dev/vchiq
+Date:		October 2016
+KernelVersion:	4.9
+Contact:	kernel-list@raspberrypi.com
+Description:
+		The ioctl interface for the VCHIQ character device.
+		Following actions are supported:
+
+		* VCHIQ_IOC_CONNECT:
+		  Establish/confirm the link to the VPU peer.
+
+		* VCHIQ_IOC_SHUTDOWN:
+		  Close the link to the VPU peer, removing all services.
+
+		* VCHIQ_IOC_CREATE_SERVICE:
+		  Create a VCHIQ service with the given FOURCC, registering a
+		  callback. If is_open is true, attempt to connect to the same
+		  FOURCC on the peer. If successful, populates the handle field
+		  in the parameter structure, otherwise returns an error.
+
+		* VCHIQ_IOC_REMOVE_SERVICE:
+		  Close and remove the service indicated by the provided
+		  handle.
+
+		* VCHIQ_IOC_QUEUE_MESSAGE:
+		  Adds the given in-band message for the indicated server to
+		  the queue.
+
+		* VCHIQ_IOC_QUEUE_BULK_TRANSMIT:
+		  Adds the given out-of-band bulk message for the indicated
+		  service to the bulk queue.
+
+		* VCHIQ_IOC_QUEUE_BULK_RECEIVE:
+		  Adds the given out-of-band bulk buffer for data from the
+		  indicated service to the bulk queue.
+
+		* VCHIQ_IOC_AWAIT_COMPLETION:
+		  The in-kernel API allows direct callbacks to client code.
+		  Userspace clients rely on the equivalent of an RPC, with the
+		  parameters for each callback marshalled into structures
+		  called completions. This method blocks waiting for
+		  completions to process.
+
+		* VCHIQ_IOC_DEQUEUE_MESSAGE:
+		  Copy the next message for the indicated service, releasing
+		  the space that was occupied. Optionally blocks if no message
+		  is waiting.
+
+		* VCHIQ_IOC_GET_CLIENT_ID:
+		  Retrieve an identifier for the client. This is intended to
+		  allow instances of multiple services to be grouped. For
+		  services provided by Linux the client ID is the pid. VPU
+		  services have a client ID of 1.
+
+		* VCHIQ_IOC_GET_CONFIG:
+		  Returns various properties of the VCHIQ configuration, such
+		  as the maximum message size and version numbers.
+
+		* VCHIQ_IOC_CLOSE_SERVICE:
+		  Cause a service to disconnect from the peer, returning it to
+		  the closed/listening state, i.e. REMOVE_SERVICE but without
+		  destroying the service.
+
+		* VCHIQ_IOC_USE_SERVICE:
+		* VCHIQ_IOC_RELEASE_SERVICE:
+		  Use to mark the start and end of activity on a service. An
+		  active service is intended to prevent the system from
+		  suspending. N.B. Raspberry Pi devices that run VCHIQ do not
+		  implement suspend/resume.
+
+		* VCHIQ_IOC_SET_SERVICE_OPTION:
+		  Sets a number of per-service options: AUTOCLOSE, SLOT_QUOTA,
+		  MESSAGE_QUOTA, SYNCHRONOUS mode and TRACE.
+
+		* VCHIQ_IOC_DUMP_PHYS_MEM:
+		  No longer implemented.
+
+		* VCHIQ_IOC_LIB_VERSION:
+		  Notify the kernel of the version of the userspace VCHIQ
+		  library being used. Currently used to determine if the
+		  CLOSE_DELIVERED ioctl is used, and therefore whether to
+		  wait for the extra handshake on a close.
+
+		* VCHIQ_IOC_CLOSE_DELIVERED:
+		  Signal that the userspace code has finished processing the
+		  close. This additional handshake avoids a race on service
+		  closure.
=2D-=20
2.34.1

