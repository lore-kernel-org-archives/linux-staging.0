Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F45B3C9EF3
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478467; cv=none; b=UWRHGgiY5eDcmLj6GOnatC7QNLjNna/7iCbqVt+gd2U+Pn3w6IZCUlR9tX918G0gH+8KsmdjRZNh3luOoRdg8ab8IxGIVrFmy6aTjSicXSHUxuWMKpn38i8bySiCBC4g2Rq7FG8YmwXiNf8qUEQ2CEIwvKpDlN+K4Sp5qcamv/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478467; c=relaxed/simple;
	bh=RZyAGUUgEq07uaFSWAqsn+EbU5vRhwxHjGRTw3KkD7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAR3lFPGFW/24wcZHqys5T+M6w3zWExKygZ3xRSy99YgtTajgUOPU2PmU3VF2SxYXT8ceDicE+qdZnS/pt8ubz11uxN8DSiOesh/aZBvg9b1jElsXHruspsx4XxUPGVgjkXB4SGzKLh70GVtHk9RVeUEpHEJ70IBTG4qPptrIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTG+Ozzg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itY+vPa5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTG+Ozzg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itY+vPa5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0GQp4181053
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H6bjSXggPs6jDy8MWuWW1A+c4FcEG+O1QoC
	hVC14BIs=; b=iTG+OzzgVxXiHUkf5mHnLOSge9TvkUqh9k/6yGk3tZ00YYF2ovk
	vhJdLRbYSXBBV5cb8l9egqtpb3uTNMzez0yCF0oESmh5m0kEpKh5uETYBalZ0xbK
	06WFSkduwKKVmlMNnM2qXaCbRUqb/drNe9QLacLA83ZzqhtKxg4U1665mjSUP148
	kX3+csbjjB/Wxe2eKttqW79cSRtOlL2Gdu/JaWmPiUXdzduhBYpXG+C2rzOIYNaa
	qj/8w9UzWCJaSfpPGjhKVMYriGZAgcXURPSHL2lXIYoWmXv/rF6mYmeUiU1Zgbq1
	rVdtXzrCzsQSnCp8bEJmridIa1WpyVybIwA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux1xu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:21:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso3411165241.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 06:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478464; x=1790083264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6bjSXggPs6jDy8MWuWW1A+c4FcEG+O1QoChVC14BIs=;
        b=itY+vPa5WY455MXD4sLqzAifBHXr1CXnSBXPJ+wfQvW7FR5ix0l1S8yEQ1RkKZfumr
         +NAFajw7oLVS7/cti3//ptGCEydfrHdtFFEZMlvxMwrZdo+zqTwXL2T3XSSQXy1VRzS9
         cnktYibQ0BjHbg/ivkQ7LkxqVmE2vpftH2Jyqy9sMH+3qkJpguiUphT7ZiD946wBbNcy
         sR+jdGKOW9rd3SzZSEzm3hfiFflmipi/s3K3uQ6r1jFI354D+aWi41wPyN2B+oS4vY09
         jMQapK8zwlyoHIXGfrZ8RYjKOg/zWVFPD444eRz2/FkRD6JUiWhRfinBnGSPxNzYW6ie
         cjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478464; x=1790083264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6bjSXggPs6jDy8MWuWW1A+c4FcEG+O1QoChVC14BIs=;
        b=iLIFlkpMysQtkfjUIpxb+plcmt0feLWmRZzt8EUQD5f9G63sMAp3n4nPo7dQgeYC3N
         mUBzAaMBiT9yRLb+KWET/yLHTY5UMaytx8AUfww/4vhOQ4ECuyBOlvp/h0p0FzonVZhy
         zLAIlf77I3MMtyaADpFhDfHlrbFbcgzc4zpgWSY4rsbdKEjyyRJAflG/Ke3rdg+WtLl+
         D2IjW2GUh7s1padWxQ49A1DSTvS+XfJY5cAN7hlVr75ljG0tVLi7TNpvr+FGCGAyHVpn
         LthUsrR2ORE+zAT/pbH/CRj2Y8hQpYxY0SOjaXI3plMkPuKABhSDBH1McZ81mQIjnqhj
         Yltg==
X-Forwarded-Encrypted: i=1; AKwUvBxJPjiEB9fHS3flZgfTCKVVKkQsOmWSopcOuNl8JJ7JHPgV6ZMNBXd1hdFAP2DjlhiCa0H/kN/nh1HZs+Jk@lists.linux.dev
X-Gm-Message-State: AFuF++mtL03Npq8crIE/CScpeDsCTjtn+U6lDJNKu0rzJFTpHy61T0QV
	aY8J1Va/HqJMJRVvYbigePR+FwJk03DRZHgR4FMGIHWUPzVotlkEEMdnY94eNO7Hjb/Rlo9s9lz
	S2Z6BbJ5HAjqR7W2R5rV1rKrGh9Rz3mpqkzWRZvYgl7qbq0ktYLR75x3+RShZ/LwMKIns
X-Gm-Gg: AYBFou3VW6aNi/PBRdcQNXNrA9eLm1TbK8YdA4SvaPipiW6q4TuW+N7B4iPESPt7HUU
	mIb0FduddkDLmBQbgYY1PmwVVlS8STdPPFK6ezCRPBN4wD5t71NDCsdW7Dx2Tsu3ZPYluflHDNP
	AAkCssJR9+oec61uH40qofhmcKZjhEubYyX+8peD3aavY7ug5t/Sx5j6Ow1CC2Ooa2utESMYlNj
	99aHB3v9MWZ4E8ks8P3Fcbn8+TDTodJDZd/KTP3MqsviwFGMdLdax7H+5xMbMymiMdjmQyipCmn
	U2TNYXFLzNnKwBNzbThuZzehvt4qBqgJzWzTHjpUiYY94cojGlHOai6+s5wPZShYwUhKT9b4a6/
	L4o+ZrYeMZqkHx+EmcUXUsbOs1raK+zPAaeTu4/NkFvcb4tD6u6R1FiXGZg==
X-Received: by 2002:a05:6102:8641:20b0:79b:95ed:4689 with SMTP id ada2fe7eead31-79b95fc923cmr6657171137.3.1789478463653;
        Tue, 15 Sep 2026 06:21:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8641:20b0:79b:95ed:4689 with SMTP id ada2fe7eead31-79b95fc923cmr6657088137.3.1789478463192;
        Tue, 15 Sep 2026 06:21:03 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613c3ebsm582885466b.57.2026.09.15.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:21:02 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH 0/2] mmc: core: Avoid export of mmc_alloc|free_host()
Date: Tue, 15 Sep 2026 15:20:44 +0200
Message-ID: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX6BtbvjHKtfz8
 1hWKN/Piu0WlaKtPvH6bqBas7My5tAkh28W5Y2Aowv/rw7yIjpX+sICYC8yGo49qMg++hB5S383
 CyKoFSKInCiiYx8Uog3YbZRXJm5DaLhDegCBootjEfeOYPg3DE3FtO5N4WEIdcF5eHPhHOA/BjN
 gNkjlLqC9S4qs01vnKfsJ9nGGopqXvZXmscGOrezzGH+JVO6enOH5su562ey+nlv0q3P9Vn+1AS
 BglVqEgWWfza/x3dDoJBD0wgwahgLhhfTN9lvQ+7hSQLJztKC/SHPHKjfQzpgYgptmqTgFjaUIv
 X/N0SF3Y52LznAdlHglVFB3IvLxvtPyYU7k7i+Ohpmurug2kpZv99XaYp9OCee7x7tNr5j8NVnU
 8Pmqxr6TkJIwq+h5FJqnAbmNlC1/V36dz+wp4NXIZdd6lJ0mz46cUsSdgu8DP2ExwZc8XrroNzC
 RCQh+e/Hwfj7wSr/+XQ==
X-Proofpoint-ORIG-GUID: tL3DL23qcN8iEoVKe60iHDrFjVWH1ziD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX9tVHvx2GMomB
 95mmjxGduHK4Eh8ivtga0+dJLeYTFbgb+4a5+4rcdgOAb54hh8gYLRytP7nUFCVgxIMqmLbehD3
 I2aqOpbQcgHmTKkl5mwoo8Edy43R174=
X-Proofpoint-GUID: tL3DL23qcN8iEoVKe60iHDrFjVWH1ziD
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa94640 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=b1TzGBc5BZYSfGZGiFAA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150194

From: Ulf Hansson <ulfh@kernel.org>

The only remaining user of mmc_alloc|free_host() is the greybus sdio driver.
Let's convert it into using the resource managed variant so we can drop the
export of mmc_alloc|free_host().

Ulf Hansson (2):
  staging: greybus: sdio: Convert to devm_mmc_alloc_host()
  mmc: core: Turn mmc_alloc|free_host() into static functions

 drivers/mmc/core/host.c        | 35 +++++++++-------------------------
 drivers/staging/greybus/sdio.c | 11 +++--------
 include/linux/mmc/host.h       |  2 --
 3 files changed, 12 insertions(+), 36 deletions(-)

-- 
2.43.0

