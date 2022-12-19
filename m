Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4567E
	for <linux-staging@lists.linux.dev>; Mon, 19 Dec 2022 11:58:28 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [IPv6:2401:4900:1f3e:7d24:3f0:3e81:fb16:ab4d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02756825;
	Mon, 19 Dec 2022 12:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1671451106;
	bh=aaumRJIlPyO334JageSyVTFWQcGmFZVA0qlebhmqQM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIh8IVwUzeljCDadac6rHsPCeLYocKmooGmbIm1MDeU54544W1A4nX0VvnOd5HM+k
	 RTwgBJ0NcqYb4HMjYvLHU9x2PkVzV05BmYQfpFHnT6ykSyZ7/PokwCAYJj55rPNXDt
	 11DJFj7OOOW2IA6msIkmPMbWc6bEgXhQuFeZp0Rc=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 7/7] staging: vc04_services: vchiq: Drop custom return values from TODO
Date: Mon, 19 Dec 2022 17:27:25 +0530
Message-Id: <20221219115725.11992-8-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219115725.11992-1-umang.jain@ideasonboard.com>
References: <20221219115725.11992-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The custom return values (enum vchiq_status) has been dropped.
Remove the TODO entry for the same.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 97085a0b3223..6d9d4a800aa7 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -40,11 +40,6 @@ beneficial to go over all of them and, if correct, comment on their merits.
 Extra points to whomever confidently reviews the remote_event_*() family of
 functions.
 
-* Get rid of custom function return values
-
-Most functions use a custom set of return values, we should force proper Linux
-error numbers. Special care is needed for VCHIQ_RETRY.
-
 * Reformat core code with more sane indentations
 
 The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
-- 
2.38.1

