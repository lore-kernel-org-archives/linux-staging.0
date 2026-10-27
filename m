Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117321;
	b=B/iv5XLYHyF+EKumYBwX7H3O9uTBHEWGtaaVdf4mvuG18NcIQF8Wf9hHMZXNb8/4zXwz
	 +FSqz7QOhNO3hx6Ctn9lwSoNWLCmlcr38CPsvUjJidUcP4oHO6J90mIMHw3b27tdJW021
	 BugiNK45MRD76bFEhwyLK9B+UzBggs0Kcz2iFGFH4OGOV5mU0UFymeg+WHUyk9V1b5uRE
	 Y9EEe+/RcqCM92GZXWzej8QH2Y0nHM3Mbsn4XbS6SI/7jlU4iN/2rndQEx6TX5PSMEa0a
	 0Pa6XjXcYtm/Z07nN4wBXD2QDpOqhviC4BmjEeXzdJtmTXph0iMTYBa+LFjeosLsO+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=meYMluchLM94txKJXWt+qZDyf5+PbHP4r+z7ZzwQ43Q=;
	b=fk58Q9rTcHkuMI5I8ngUiQxqnMl3QJQbloKMuuGaz2RWXhSY06Fkf1udeaeBgwYnXzsX
	 5P9Bdv6rINmzswe0nQa72K2T/bpj6KFerpxuhGZLd2fjBnOBZ7mqsUBWbw99auVmt1mJJ
	 gduVXc1Dy3XXnePGowIhDKLjFyKOyQNaRbX0aIOxQkmJfpSQiyvKgSYdK8N1vqeg9AO/n
	 MAU8Eljpw98Z2VZOnd4oL4wHLQm6ZYYVyDW8Jwb0jzdiNVbEybyEIGjEKN8vPRti6JQFa
	 o/MVmRBX78N/p0t2cTf4FfxNt3SzF4ELi8aaezmKMIs8Y2WElWfjaLygcA2yy+IcygQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1YtSc3P;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D7606A32F
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 16:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4D7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1YtSc3P
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1846bc43c28so5031364c88.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117321; x=1793722121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=meYMluchLM94txKJXWt+qZDyf5+PbHP4r+z7ZzwQ43Q=;
        b=x1YtSc3PbvTPNhdM208IQmw3SoD3ojapzLGQDIohukjIZRjptz4Nyr+OiHeQdArCrP
         Ytdskng0jmV0tUGKp/Fyv8JJZ0pzuxmCE1Z234/EFSESPuU0ErOzxr+1fVxPMNKa7+mb
         5PsVMzhw/ZPy+hnZDCkPgAQ02hWiyYYD7rMUqVou2hVFgWrNZNnvWd89H5z16wm9bFub
         ybeTjSeOauAC3MROOLEogjwJQBtj2ORHDa3L3JvL/XHQ1iPK2j7mzeWY3Y4B2fwcuGEZ
         8A0yWZKjOdsLbwG4lppz/qIuZG7qYIY2P3Hnqjs3KQS+yRtnRpa0l3HLoZd4PSZ3wASB
         8sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117321; x=1793722121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meYMluchLM94txKJXWt+qZDyf5+PbHP4r+z7ZzwQ43Q=;
        b=FVONkQTFrjluC2lcHBRcE7efgZaq0/hA0Bvlg6/ShSCpWYksko6ykHDOCzixH0WsJV
         SlX9TA1hEhh6pwdT5LMSA6yjRPzSLS4a+1V8Z04PW/KDHqwVw+vI+bJKTv93jZAL0bPd
         dDQMyVWx3tOdqKUoK6SzzmEaIMslAUxvHfAfiV+6s0sgKz7wGTHr7Q/63F7DqE6cabeE
         ZDnmtDp36dcxnHvhjt557SjX18rrQpR9rlL6WaEwQB26AwCT/g0P14wdGpAwsOyueHKp
         qArrNKWSbnh0rbfViqOg9lsxuLF9pjEZUZJ1hD2fdRtVwi7QuwmnRxgrXTLnsvCHAiyO
         ZGPw==
X-Forwarded-Encrypted: i=1; AKwUvByG1jPSfgJCqueAkD0kjxS2oml4HpUGQzNBf5Ac4XZz676N7A8OnbcRi5kNoG++HmlH21ZXfOocJ+fmEdAz@lists.linux.dev
X-Gm-Message-State: AFq9FYKbQQfi1VQCVnh4rA0wmXC7MLF8JGmDDCabJroT+WlF143u/PV5
	k0mesiPd4NFojibsIuONRTUwl3T9Lp3xYy05gNAy0uLGlHd5Ks6ScLpF
X-Gm-Gg: AYBFou39FcjZqOaQYMN5Oh4DH/+8RwBDqZ0w2vQvlr8T3TEx4ViHDRPlVCYJINrqGuX
	+sa3LzaB0+AUUfhylMj2Qrx9VjnqfhxUZ9gKF0fKQs6+7BOGgaa72+m0eGb9dm+Z/E+PUu60SzW
	dWn/cVK6qg67ltNETCxWAehNgs7cJC00XabHUc++5X9CIzL/OZ180xX9xuS2crgK6ReYChy+WM5
	nqoEuqIEDKVNA+G+qdZ/VMBNlzZP+StucLhV2cLzbDC1RNRQ5MJycz/fQlcRJzz7Ukfk1hJU6DJ
	SA96cm29ApE8etJ5pinkaLdS7NREQaa/p2Uw9FW7XhGmPuHVNjiiVJ8+AbmZCIO3cNUnOJHYurX
	pyqWvtwtvEYuVoi1hc3go5UKkhctOFmwnX3n2S4djH1H3mS4uLlcoDIyRCBowQxhtO+ORXzb5LD
	5/5wAlGq2Z9v05IdNMJ+06ufphEYS9DO6nbfDLL9M4vRznZsiatVH6nGpKo6McCQ08AAQ7Q0Ow5
	RJJRvUPrHiZ0Kff+PDOpYwkvc1DaxM521TuJHhtNKQGygmF0Lct09pbw5Yh8rvMUud9peKuNTR7
	Jo4XMJzq4a+F2TsuksK+29FzPA==
X-Received: by 2002:a05:701b:230e:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1a0b6505d9dmr7245819c88.41.1793117320361;
        Tue, 27 Oct 2026 09:08:40 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.85.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm40053759c88.10.2026.10.27.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:08:39 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH] staging: iio: impedance-analyzer: ad5933: use devm_mutex_init()
Date: Tue, 27 Oct 2026 16:08:29 +0000
Message-ID: <20261027160829.1731-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace mutex_init() with devm_mutex_init() in ad5933_probe() and
check its return value. The driver already uses devm_* helpers for its
other resources and has no remove() callback, so this ensures the
mutex is destroyed automatically on teardown when mutex debugging is
enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index c05a5f4b4..51d73c5ab 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -672,7 +672,9 @@ static int ad5933_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, indio_dev);
 	st->client = client;
 
-	mutex_init(&st->lock);
+	ret = devm_mutex_init(&client->dev, &st->lock);
+	if (ret)
+		return ret;
 
 	ret = devm_regulator_get_enable_read_voltage(&client->dev, "vdd");
 	if (ret < 0)
-- 
2.53.0

