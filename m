Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4F185F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667731984; bh=P511zN2InPdNvrRnB0K28toXp6sPyjr5q7mpbN+Phxs=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=Js4nOvXqElOPY+ADGQiJMuces9xrJoM0uvp4b1kcdgDOKJvvNG6mDaB8Y06ottBa8
	 99Lszjv4Jn54X3IH9R9ZcYLFQKVCoj8VRaHKdemn1l8vh1c8JxeU3oKovj+qgzsbTF
	 gt9FCS6wFf9Y7qfreMrz5ow/annq90luWmXYkJTQ=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sun,  6 Nov 2022 11:53:04 +0100 (CET)
X-EA-Auth: Hal3GwnzE98f7ibZUA1R4tCAbhvtkzya0fsqlGOa7fA9lTF2PWQ3UYiPofnxKw8kPk3sa+MRhvTsOHr+ioII4WdGqUdQ8cdR
Date: Sun, 6 Nov 2022 16:22:57 +0530
From: Deepak R Varma <drv@mailo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: patches for staging:media drivers
Message-ID: <Y2eSCZJNWn6DzCUu@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Greetings to all.
My name is Deepak R Varma and I was part of the recent Outreachy internship
round. I learned during this program that patches for the media drivers were
prohibited to be included in the Outreachy effort due to lack of bandwidth for
the maintainers to respond on those.

The Outreachy round is now over but I am continuing to work on code improvement
and changes. I would like to know if it is okay for me to now identify
opportunities in the media drivers and send patch proposal for your kind
consideration. I intend to send couple of Coccinelle identified code
improvements as patches.

Please let me know.

Thank you,
./drv


